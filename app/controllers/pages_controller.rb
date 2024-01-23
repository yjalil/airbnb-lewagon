class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard
  def home
    render
  end
  def dashboard
    if current_user.role == "hrayfi"
      @jobs = Job.where(hrayfi_id: current_user.id)
    elsif current_user.role == "client"
      @reservations = Reservation.where(client_id: current_user.id)
    end
  end
end
