class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def new
    @film = Film.new
    @watched_collection = ["Yes", "No"]
  end

  def create
    @film = Film.new(films_params)

    if @film.save
      flash[:notice] = "Movie added successfully"
      redirect_to films_path
    else
      @watched_collection = ["Yes", "No"]
      flash[:error] = @film.errors.full_messages.join(". ")
      render :new
    end
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
