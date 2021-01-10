class TeachersController < ApplicationController

  # Teacher Role
  get "/teachers" do
    erb :"/teachers/index.html"
  end

  # Admin Role
  get "/teachers/new" do
    erb :"/teachers/new.html"
  end

  # Admin Role
  post "/teachers" do
    @teacher = Teacher.create(params)
    session[:teacher_id] = @teacher.id
    redirect "/teachers"
  end

  # Teacher Role
  get "/teachers/:id" do
    @teacher = Teacher.find(params[:id])
    erb :"/teachers/show.html"
  end

  # Teacher Role
  get "/teachers/:id/edit" do
    @teacher = Teacher.find(params[:id])
    ## Check for Admin rights
    # if admin? 
       erb :"/teachers/edit.html"
    # end

    ## If not Admin, check that this user has access
    # if user_has_access?
    #   erb :"/teachers/edit.html"
    # else
    #   erb :"/failure.html"
    # end
  end

  patch "/teachers/:id" do
    @teacher = Teacher.find(params[:id])
    @teacher.update(params[:teacher])
    redirect "/teachers/#{@teacher.id}"
  end

  ## Admin Role
  # delete "/teachers/:id/delete" do
  #   redirect "/teachers"
  # end
end
