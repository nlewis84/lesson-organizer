class StudentsController < ApplicationController

  get "/students" do
    if logged_in?
      erb :"/students/index.html"
    else
      redirect "/login"
    end
  end

  get "/students/new" do
    if logged_in?
      erb :"/students/new.html"
    else
      redirect "/login"
    end
  end

  post "/students" do
    if logged_in?
      @student = Student.create(params)
      redirect "/students/#{@student.id}"
    else
      redirect "/login"
    end
  end

  get "/students/:id" do
    if logged_in?
      @student = Student.find(params[:id])
      erb :"/students/show.html"
    else
      redirect "/login"
    end
  end

  get "/students/:id/edit" do
    if logged_in?
      @student = Student.find(params[:id])
      if @student && @student.admin == current_user
        erb :"/students/edit.html"
      else
        redirect "/students"
      end
    else
      redirect "/login"
    end
  end

  patch "/students/:id" do
    if logged_in?
      @student = Student.find(params[:id])
      @student.update(params[:student])
      @student.save
      redirect "/students/#{@student.id}" 
    else
      redirect "/login"
    end
  end

  delete "/students/:id/delete" do
    if logged_in?
      @student = Student.find(params[:id])
      @student.delete
      redirect "/students"
    else
      redirect "/login"
    end
  end
end
