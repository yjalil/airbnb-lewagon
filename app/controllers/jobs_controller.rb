class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_hrayfi, only: [:details]
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
    if @job.save
      redirect_to jobs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def details
    @jobs = Job.where(hrayfi_id: @hrayfi.id)
  end

  def edit
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


  def job_params
    params.require(:job).permit(:title, :start_time, :end_time, :preview)
  end
end
