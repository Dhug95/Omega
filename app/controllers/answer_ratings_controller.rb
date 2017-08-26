class AnswerRatingsController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_rating][:answer_id])
    @rating = @answer.answer_rating.create(:stars => 1)
    valutation = @answer.valutation + 1
    @answer.update_attribute(:valutation, valutation)
    puts @answer.valutation
    current_user.answer_rating << @rating
  end
    
  def update
    @answer = Answer.find(params[:answer_rating][:answer_id])
    rating = AnswerRating.find(params[:id])
    if rating.stars == 0
      rating.update_attribute(:stars, 1)
      valutation = @answer.valutation + 1
    else
      rating.update_attribute(:stars, 0)
      valutation = @answer.valutation - 1
    end
    @answer.update_attribute(:valutation, valutation)
    puts @answer.valutation
  end
  
  private
    def answer_rating_params
      params.require(:answer_rating).permit(:stars)
    end
end
