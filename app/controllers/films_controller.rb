class FilmsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      @films = current_user.films.order("title ASC")
      # @films = Film.order(:title).page params[:page]
      if params[:sort_order] == "high_to_low"
        @films = current_user.films.order("rating DESC")
      elsif params[:sort_order] == "low_to_high"
        @films = current_user.films.order("rating ASC")
      elsif params[:sort_order] == "a_to_z"
        @films = current_user.films.order("title ASC")
      elsif params[:search]
        @films = current_user.films.search(params[:search]).order(:title)
      end
      @film = Film.new
      @watched_collection = ["Yes", "No"]
      @rating_collection = [1, 2, 3, 4, 5]
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
    @rating_collection = [1, 2, 3, 4, 5]
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      flash[:notice] = "Movie added successfully"
      redirect_to films_path
    else
      @watched_collection = ["Yes", "No"]
      @rating_collection = [1, 2, 3, 4, 5]
      flash[:error] = @film.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @watched_collection = ["Yes", "No"]
    @rating_collection = [1, 2, 3, 4, 5]
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
  :watched,
  :rating
  ).merge(user: current_user)
end
