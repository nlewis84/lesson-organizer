class TeachersController < ApplicationController

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

  get "/teachers/:id" do
    @teacher = Teacher.find(params[:id])
    erb :"/teachers/show.html"
  end

  get "/teachers/:id/edit" do
    @teacher = Teacher.find(params[:id])
    erb :"/teachers/edit.html"
  end

  patch "/teachers/:id" do
    @teacher = Teacher.find(params[:id])
    @teacher.update(params[:teacher])
    redirect "/teachers/#{@teacher.id}"
  end

  # Admin Role
  delete "/teachers/:id/delete" do
    @teacher = Teacher.find(params[:id])
    # @teacher.lessons.delete
    @teacher.delete
    redirect "/teachers"
  end
end
