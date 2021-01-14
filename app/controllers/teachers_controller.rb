class TeachersController < ApplicationController

  get "/teachers" do
    if logged_in?
      erb :"/teachers/index.html"
    else
      redirect "/login"
    end
  end

  get "/teachers/new" do
    if logged_in?
      erb :"/teachers/new.html"
    else
      redirect "/login"
    end
  end

  post "/teachers" do
    if logged_in?
      @teacher = Teacher.create(params)
      redirect "/teachers"
    else
      redirect "/login"
    end
  end

  get "/teachers/:id" do
    if logged_in?
      @teacher = Teacher.find(params[:id])
      erb :"/teachers/show.html"
    else
      redirect "/login"
    end
  end

  get "/teachers/:id/edit" do
    if logged_in?
      @teacher = Teacher.find(params[:id])
      erb :"/teachers/edit.html"
    else
      redirect "/login"
    end
  end

  patch "/teachers/:id" do
    if logged_in?
      @teacher = Teacher.find(params[:id])
      @teacher.update(params[:teacher])
      redirect "/teachers/#{@teacher.id}"
    else
      redirect "/login"
    end
  end

  delete "/teachers/:id/delete" do
    if logged_in?
      @teacher = Teacher.find(params[:id])
      @teacher.lessons.each { |l| l.destroy }
      @teacher.delete
      redirect "/teachers"
    else
      redirect "/login"
    end
  end
end
