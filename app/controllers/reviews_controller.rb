class ReviewsController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
    @review = @property.reviews.create(reviews_params)
    current_user.reviews << @review
    redirect_to property_path(@property)
  end

  def destroy
    @property = Property.find(params[:property_id])
    @review = @property.reviews.find(params[:id])
    @review.destroy
    redirect_to property_path(@property)
  end

  private
    def reviews_params
      params.require(:review).permit(:title, :body, :valutation)
    end
end
