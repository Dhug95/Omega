class RatingsController < ApplicationController
    def create
      @question = Question.find(params[:rating][:question_id])
      @rating = @question.ratings.create(rating_params)
      current_user.ratings << @rating
    end
    
    def update
      rating = Rating.find(params[:id])
      if (rating.user_id != current_user.id)
        create
      else
        rating.update_attribute(:stars, params[:rating][:stars])
      end
    end
    
    private
      def rating_params
        params.require(:rating).permit(:stars)
      end
end

