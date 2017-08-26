class RatingsController < ApplicationController
    def create
      @question = Question.find(params[:rating][:question_id])
      @rating = @question.ratings.create(rating_params)
      current_user.ratings << @rating
    end
    
    def update
      rating = Rating.find(params[:id])
      rating.update_attribute(:stars, params[:rating][:stars])
    end
    
    private
      def rating_params
        params.require(:rating).permit(:stars)
      end
end

