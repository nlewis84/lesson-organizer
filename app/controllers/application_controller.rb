require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  get '/account' do
    @teacher = Teacher.find(session[:teacher_id])
    erb :account
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    @teacher = Teacher.find_by(username: params[:username])
    if @teacher
      session[:teacher_id] = @teacher.id
      redirect '/account'
    else
      redirect '/failure'
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      Teacher.find(session[:teacher_id])
    end
  end

end