class HotelsController < ApplicationController


  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.user = current_user #-> permet de préciser quelle est l'utilisateur qui fait la création
    if @hotel.save
      redirect_to hotels_path()
    else
      render :new
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotel_path(@hotel), status: :see_other
  end

private

  def hotel_params
    params.require(:hotel).permit(:name, :adresse)
  end

end
