class LessonsController < ApplicationController

  # GET: /lessons
  get "/lessons" do
    erb :"/lessons/index.html"
  end

  # GET: /lessons/new
  get "/lessons/new" do
    erb :"/lessons/new.html"
  end

  # POST: /lessons
  post "/lessons" do
    redirect "/lessons"
  end

  # GET: /lessons/5
  get "/lessons/:id" do
    erb :"/lessons/show.html"
  end

  # GET: /lessons/5/edit
  get "/lessons/:id/edit" do
    erb :"/lessons/edit.html"
  end

  # PATCH: /lessons/5
  patch "/lessons/:id" do
    redirect "/lessons/:id"
  end

  # DELETE: /lessons/5/delete
  delete "/lessons/:id/delete" do
    redirect "/lessons"
  end
end
