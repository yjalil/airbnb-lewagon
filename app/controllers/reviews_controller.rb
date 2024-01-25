class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @job = job.find(params[:job_id])
    @review = @job.reviews.build
  end

  def create
    @job = job.find(params[:job_id])
    @review = @job.reviews.build(review_params.merge(user: current_user))

    if review.save?
      flash[:success] = 'Review successfully created!'
      redirect_to job_path(@job)
    else
      flash[:error] = 'Review creation failed.'

      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
