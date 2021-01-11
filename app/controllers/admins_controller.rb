class AdminsController < ApplicationController

  get '/admins/home' do
    binding.pry
    @admin = Admin.find(session[:admin_id])
    erb :'/admins/home.html'
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
end
