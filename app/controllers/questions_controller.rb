class QuestionsController < ApplicationController
  def create
   @property = Property.find(params[:property_id])
   @question = @property.questions.create(question_params)
   @question.update_attribute(:valutation, 0)
   current_user.questions << @question
   redirect_to property_path(@property)
 end

 def destroy
    @property = Property.find(params[:property_id])
    @question = @property.questions.find(params[:id])
    @question.destroy
    redirect_to property_path(@property)
  end

 def show
   @property = Property.find(params[:id])
   @question = @property.questions.find(params[:property_id])
 end
 
 def update
   question = Question.find(params[:property_id])
   question.update_attribute(:valutation, question.valutation + 1)
 end

 private
   def question_params
     params.require(:question).permit(:body)
   end
end
