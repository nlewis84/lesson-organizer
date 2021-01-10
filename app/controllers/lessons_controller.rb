class LessonsController < ApplicationController

  get "/lessons" do
    erb :"/lessons/index.html"
  end

  get "/lessons/new" do
    erb :"/lessons/new.html"
  end

  post "/lessons" do
    redirect "/lessons"
  end

  get "/lessons/:id" do
    erb :"/lessons/show.html"
  end

  get "/lessons/:id/edit" do
    erb :"/lessons/edit.html"
  end

  patch "/lessons/:id" do
    redirect "/lessons/:id"
  end

  delete "/lessons/:id/delete" do
    redirect "/lessons"
  end
end
