class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

      if @attraction.save
        redirect_to "/attractions/#{@attraction.id}"
      else
        redirect_to "/attractions/new"
      end
  end

  def edit
    set_attraction
  end

  def update
    set_attraction
      if @attraction.update(attraction_params)
          redirect_to "/attractions/#{@attraction.id}"
      else
          "/attractions/#{@attraction.id}/edit"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
    end

end
