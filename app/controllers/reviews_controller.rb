class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if @review.save
      redirect_to :back
    else
      redirect_to :back, error: @review.errors.full_messages
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to :back
  end

private
  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
