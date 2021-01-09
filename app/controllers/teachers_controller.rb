class TeachersController < ApplicationController

  # GET: /teachers
  get "/teachers" do
    erb :"/teachers/index.html"
  end

  # GET: /teachers/new
  get "/teachers/new" do
    erb :"/teachers/new.html"
  end

  # POST: /teachers
  post "/teachers" do
    redirect "/teachers"
  end

  # GET: /teachers/5
  get "/teachers/:id" do
    erb :"/teachers/show.html"
  end

  # GET: /teachers/5/edit
  get "/teachers/:id/edit" do
    erb :"/teachers/edit.html"
  end

  # PATCH: /teachers/5
  patch "/teachers/:id" do
    redirect "/teachers/:id"
  end

  # DELETE: /teachers/5/delete
  delete "/teachers/:id/delete" do
    redirect "/teachers"
  end
end
