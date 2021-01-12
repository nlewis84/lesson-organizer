class AdminsController < ApplicationController

  get '/admins/home' do
    @admin = Admin.find(session[:admin_id])
    erb :'/admins/home.html'
  end

end
