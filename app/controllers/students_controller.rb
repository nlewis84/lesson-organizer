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
      ## start
      if @student && @student.admin == current_user
      ## end
        erb :"/students/edit.html"
      ## start
      else
        redirect "/students"
      end
      ## end
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

  # Should also delete any lessons of this student
  delete "/students/:id/delete" do
    if logged_in?
      @student = Student.find(params[:id])
      # @student.lessons.delete
      @student.delete
      redirect "/students"
    else
      redirect "/login"
    end
  end
end
