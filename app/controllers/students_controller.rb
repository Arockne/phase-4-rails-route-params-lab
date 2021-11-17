class StudentsController < ApplicationController

  def index
    students = Student.all
    if (params[:name])
      name = params[:name].downcase
      students = students.filter do |s| 
        s.first_name.downcase.include?(name) || s.last_name.downcase.include?(name)
      end
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
