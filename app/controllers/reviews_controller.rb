class ReviewsController < ApplicationController

  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :set_review, only: [:new, :create]

  def index 
    @reviews = Review.eager_load(:comments).order('reviews.id ASC').paginate(page: params[:page], per_page: 10)
  end

  def create
    create_or_update
  end

  def update
    create_or_update
  end

  def destroy
    @review.destroy
    if @review.destroyed?
      flash.now[:notice] = t('.notice')
    else
      flash.now[:error] = t('.error')
    end    
    redirect_to :reviews
  end

  private

  def create_or_update
    @review.assign_attributes(review_params.merge(user: current_user))
    if @review.save
      flash.now[:notice] = t('.notice')
    else
      flash.now[:error] = @review.errors.present? ? @review.errors.full_messages.join(' ') : t('.error')
    end    
    redirect_to :reviews
  end

  def review_params
    params.require(:review).permit(:review_text)
  end

  def find_review
    @review = Review.find_by(id: params[:id])
  end

  def set_review
    @review = Review.new
  end

end
