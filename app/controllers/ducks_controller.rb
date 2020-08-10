class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    find_duck
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.new(duck_params)

    if @duck.valid?
      @duck.save
      redirect_to duck_path(@duck)
    else
      render :new
    end
  end

  def edit
    find_duck
  end

  def update
    find_duck

    if @duck.update(duck_params)
      redirect_to(@duck)
    else
      render :edit
    end
  end

  private

  def find_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end