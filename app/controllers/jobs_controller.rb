class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :add_preview]
  before_action :set_hrayfi, only: [ :details]



  def index
    if params[:query].present?
      @query = params[:query]
      @jobs = Job.where("title LIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    user = User.find(params[:job][:hrayfi_id])
    new_job_values(user)
    @job.hrayfi_id = params[:job][:hrayfi_id]
    @reservation = Reservation.new
    @reservation.status = "Pending"
    @reservation.client_id = current_user.id
    if @job.save!
      @reservation.job_id = @job.id
      @reservation.save!
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def details
    @jobs = Job.where(hrayfi_id: @hrayfi.id)
  end

  def accept

    @reservation = Reservation.where(job_id: params[:job_id]).first
    @reservation.status = "Accepted"
    @reservation.save!
    redirect_to dashboard_path
  end

  def refuse
    @reservation = Reservation.where(job_id: params[:job_id]).first
    @reservation.status = "Refused"
    @reservation.save!
    redirect_to dashboard_path
  end

  def finish
    @reservation = Reservation.where(job_id: params[:job_id]).first
    @reservation.status = "Finished"
    @reservation.save!
    redirect_to dashboard_path
  end

  def edit
  end

  def edit_preview
    @job = Job.find(params[:job_id])
  end

  def add_preview
    @job = Job.find(params[:job_id])
    @job.update(params.require(:job).permit(:preview))

  end



  def update
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, status: :see_other
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def set_hrayfi
    @hrayfi = User.find(params[:id])
  end

  def new_job_values(hrayfi)
    @job.cost = ((@job.end_time - @job.start_time)/1.hour).round * hrayfi.hour_rate
  end

  def job_params
    params.require(:job).permit(:title, :start_time, :end_time, :preview, :description, :hrayfi_id).select { |x, v| v.present? }
  end

end
