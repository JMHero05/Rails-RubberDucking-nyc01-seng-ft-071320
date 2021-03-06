class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    find_student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
    find_student
  end

  def update
    find_student

    if @student.update(student_params)
      redirect_to(@student)
    else
      render :edit
    end
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
