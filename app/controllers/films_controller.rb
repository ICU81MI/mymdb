class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def new
  end

  def create
  end
end

private

def films_params
  params.require(:film).permit(
  :title,
  :year,
  :cast,
  :description,
  :watched)
end
