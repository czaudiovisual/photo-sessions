   class BookingsController < ApplicationController

    skip_before_action :authorize
    
    def index
        bookings = Booking.all.includes(:user)
        render json: bookings, status: :ok
    end
 
    def show
        booking = find_booking
        render json: booking, status: :ok
    end

    def create
        booking = Booking.create!(booking_params)
        render json: booking, status: :created
    end

    def update
        booking = Booking.find(params[:id])
        booking.update(booking_params)
        render json: booking, status: :ok
    end

    def destroy
        booking = find_booking
        booking.destroy
        head :no_content
    end

    private

    def find_booking
        Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:style, :time, :date, :location, :img_url, :description, :user_id)
    end
end