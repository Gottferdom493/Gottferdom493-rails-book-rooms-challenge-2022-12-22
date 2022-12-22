class RoomsController < ApplicationController

  def index
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = Room.where(hotel: @hotel)
  end

  def show
    @rooms = Room.where(hotel: @hotel)
    @room = Room.find(params[:id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @hotel = Hotel.find(params[:hotel_id])
    @room.hotel = @hotel #-> le .hotel est utilisable grâce au belongs_to dans ton modèle. Cela permet de créer une méthode d'instance qui est .hotel
    @room.user = current_user  #-> permet de préciser quelle est l'utilisateur qui fait la création
    if @room.save
      redirect_to hotel_rooms_path(), notice: "Comment has been added"
    else
      render :new
    end
  end

  # def destroy
  #   @room = Room.find(params[:id])
  #   @room.destroy
  #   redirect_to hotel_path(@room.hotel)
  # end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to hotel_path(@room.post), status: :see_other
  end

  private

  def room_params
    params.require(:room).permit(:capacity, :price)
  end

end
