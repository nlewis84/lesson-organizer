class StudentsController < ApplicationController

  # GET: /students
  get "/students" do
    erb :"/students/index.html"
  end

  # GET: /students/new
  get "/students/new" do
    erb :"/students/new.html"
  end

  # POST: /students
  post "/students" do
    redirect "/students"
  end

  # GET: /students/5
  get "/students/:id" do
    erb :"/students/show.html"
  end

  # GET: /students/5/edit
  get "/students/:id/edit" do
    erb :"/students/edit.html"
  end

  # PATCH: /students/5
  patch "/students/:id" do
    redirect "/students/:id"
  end

  # DELETE: /students/5/delete
  delete "/students/:id/delete" do
    redirect "/students"
  end
end
