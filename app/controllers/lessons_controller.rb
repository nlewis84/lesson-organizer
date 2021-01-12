class LessonsController < ApplicationController

  get "/lessons" do
    erb :"/lessons/index.html"
  end

  get "/lessons/new" do
    erb :"/lessons/new.html"
  end

  post "/lessons" do
    @lesson = Lesson.create(params)
    redirect "/lessons"
  end

  get "/lessons/:id" do
    @lesson = Lesson.find(params[:id])
    erb :"/lessons/show.html"
  end

  get "/lessons/:id/edit" do
    @lesson = Lesson.find(params[:id])
    erb :"/lessons/edit.html"
  end

  patch "/lessons/:id" do
    @lesson = Lesson.find(params[:id])
    @lesson.update(params[:lesson])
    redirect "/lessons/#{@lesson.id}"
  end

  delete "/lessons/:id/delete" do
    @lesson = Lesson.find(params[:id])
    @lesson.delete
    redirect "/lessons"
  end
end
