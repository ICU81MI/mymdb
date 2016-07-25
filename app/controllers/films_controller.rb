class FilmsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      @films = Film.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
    @film = Film.new
    @watched_collection = ["Yes", "No"]
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      flash[:notice] = "Movie added successfully"
      redirect_to films_path
    else
      @watched_collection = ["Yes", "No"]
      flash[:error] = @film.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @watched_collection = ["Yes", "No"]
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])

    if @film.update(film_params)
      flash[:notice] = "Movie successfully updated"
      redirect_to film_path(@film)
    else
      flash[:alert] = "Movie not updated"
      render :edit
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    flash[:notice] = "Movie deleted"
    redirect_to films_path
  end
end

private

def film_params
  params.require(:film).permit(
  :title,
  :year,
  :cast,
  :description,
  :watched)
end
