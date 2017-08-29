class RatingsController < ApplicationController
    def create
      @question = Question.find(params[:rating][:question_id])
      @rating = @question.ratings.create(rating_params)
      current_user.ratings << @rating
      redirect_back(fallback_location: root_path)
    end
    
    def update
      rating = Rating.find(params[:id])
      if (rating.user_id != current_user.id)
        create
      else
        rating.update_attribute(:stars, params[:rating][:stars])
      end
      question = Question.find(rating.question_id)
      val_media = question.ratings.sum(:stars) / question.ratings.count()
      question.update_attribute(:valutation, val_media)
    end
    
    private
      def rating_params
        params.require(:rating).permit(:stars)
      end
end

