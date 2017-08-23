class QuestionsController < ApplicationController
  def create
   @property = Property.find(params[:property_id])
   @question = @property.questions.create(question_params)
   current_user.questions << @question
   redirect_to property_path(@property)
 end

 private
   def question_params
     params.require(:question).permit(:body)
   end
end
