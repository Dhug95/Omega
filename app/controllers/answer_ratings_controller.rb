class AnswerRatingsController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_rating][:answer_id])
    @rating = @answer.answer_rating.create(answer_rating_params)
    current_user.answer_rating << @rating
  end
    
  def update
    rating = AnswerRating.find(params[:id])
    rating.update_attribute(:stars, params[:answer_rating][:stars])
  end
  
  private
    def answer_rating_params
      params.require(:answer_rating).permit(:stars)
    end
end
