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

  get "/login" do
    erb :login
  end

  post "/login" do
    @admin = Admin.find_by(email: params[:email])

    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect '/success'
    else
      redirect '/login'
    end
  end

  get "/success" do
    if logged_in?
			redirect "/admins/home"
		else
			redirect "/login"
		end
	end

  get "/logout" do
    session.clear
    redirect "/"
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