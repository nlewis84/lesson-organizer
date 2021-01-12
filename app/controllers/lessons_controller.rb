class LessonsController < ApplicationController

  get "/lessons" do
    if logged_in?
      erb :"/lessons/index.html"
    else
      redirect "/login"
    end
  end

  get "/lessons/new" do
    if logged_in?
      erb :"/lessons/new.html"
    else
      redirect "/login"
    end
  end

  post "/lessons" do
    if logged_in?
      @lesson = Lesson.create(params)
      redirect "/admins/home"
    else
      redirect "/login"
    end
  end

  get "/lessons/:id" do
    if logged_in?
      @lesson = Lesson.find(params[:id])
      erb :"/lessons/show.html"
    else
      redirect "/login"
    end
  end

  get "/lessons/:id/edit" do
    if logged_in?
      @lesson = Lesson.find(params[:id])
      erb :"/lessons/edit.html"
    else
      redirect "/login"
    end
  end

  patch "/lessons/:id" do
    if logged_in?
      @lesson = Lesson.find(params[:id])
      @lesson.update(params[:lesson])
      redirect "/lessons/#{@lesson.id}"
    else
      redirect "/login"
    end
  end

  delete "/lessons/:id/delete" do
    if logged_in?
      @lesson = Lesson.find(params[:id])
      @lesson.delete
      redirect "/lessons"
    else
      redirect "/login"
    end
  end
end
