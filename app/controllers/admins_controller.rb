class AdminsController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect '/admins/home'
    else
      erb :"/admins/login.html"
    end
  end

  post '/signup' do
    if params[:name] == "" || params[:campus] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @admin = Admin.create(:name => params[:name], :campus => params[:campus], :email => params[:email], :password => params[:password])
      session[:admin_id] = @admin.id
      redirect to '/admins/home'
    end
  end

  get "/login" do
    erb :"/admins/login.html"
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

  get "/logout" do
    if logged_in?
      session.destroy
			redirect "/login"
	 	else
	 		redirect "/"
	 	end
  end

  get '/admins/home' do
    if logged_in?
      @admin = Admin.find(session[:admin_id])
      erb :'/admins/home.html'
    else
      redirect '/login'
    end
  end

  get "/admins/:id" do
    if logged_in?
      @admin = Admin.find(params[:id])
      erb :"/admins/show.html"
    else
      redirect "/login"
    end
  end

  get "/admins/:id/edit" do
    if logged_in?
      @admin = Admin.find(params[:id])
      if @admin && @admin == current_user
        erb :"/admins/edit.html"
      else
        redirect "/admins/home"
      end
    else
      redirect "/login"
    end
  end

  patch "/admins/:id" do
    if logged_in?
      @admin = Admin.find(params[:id])
      @admin.update(params[:admin])
      redirect "/admins/home"
    else
      redirect "/login"
    end
  end

end
