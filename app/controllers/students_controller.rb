class StudentsController < ApplicationController

  get "/students" do
    erb :"/students/index.html"
  end

  get "/students/new" do
    erb :"/students/new.html"
  end

  post "/students" do
    @student = Student.create(params)
    redirect "/students/#{@student.id}"
  end

  get "/students/:id" do
    @student = Student.find(params[:id])
    erb :"/students/show.html"
  end

  get "/students/:id/edit" do
    @student = Student.find(params[:id])
    erb :"/students/edit.html"
  end

  patch "/students/:id" do
    @student = Student.find(params[:id])
    @student.update(params[:student])

    if !params[:lesson][:time].empty? && !params[:lesson][:day].empty? && !params[:lesson][:campus].empty? && !params[:lesson][:teacher_id].empty?
      @student.lessons << Lesson.create(params[:lesson])
    end

    @student.save

    redirect "/students/#{@student.id}"
  end

  # Should also delete any lessons of this student
  delete "/students/:id/delete" do
    @student = Student.find(params[:id])
    # @student.lessons.delete
    @student.delete
    redirect "/students"
  end
end
