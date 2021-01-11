require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "lesson"
  end

  get "/" do
    redirect '/success'
  end

  get "/failure" do
    erb :failure
  end

  helpers do
    def logged_in?
      !!session[:admin_id]
    end

    def admin?
      !!session[:admin]
    end

    def user_has_access?
      session[:teacher_id] == params[:id]
    end

    def current_user
      Admin.find(session[:admin_id])
    end

    def user_notification
      if logged_in?
        @user = Admin.find(session[:admin_id])
        "Logged in as #{@user.name}"
      else
        "Not currently logged in."
      end
    end
  end

end