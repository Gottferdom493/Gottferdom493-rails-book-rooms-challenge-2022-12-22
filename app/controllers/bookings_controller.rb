class BookingsController < ApplicationController

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    @hotel = Hotel.find(params[:hotel_id])

    @booking.room = @room
    @booking.user = current_user
    if @booking.save
      redirect_to hotel_room_path(@hotel, @room), notice: "Réservation effectuée"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
