class AdminsController < ApplicationController

  get "/login" do
    erb :login
  end

  post "/login" do
    @admin = Admin.find_by(email: params[:email])

    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect '/admins/home'
    else
      redirect '/login'
    end
  end

  # get "/success" do
  #   if logged_in?
	# 		redirect "/admins/home"
	# 	else
	# 		redirect "/login"
	# 	end
	# end

  get "/logout" do
    if logged_in?
      session.destroy
			redirect "/login"
	 	else
	 		redirect "/"
	 	end
  
  end

  # This may need to get moved further up the file
  get '/admins/home' do
    @admin = Admin.find(session[:admin_id])
    erb :'/admins/home.html'
  end

end
