class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    
 
    if @question.save
      QuestionMailer.question_email(@question).deliver
    end

    redirect_to home_path
  end

  private
    def question_params
      params.require(:question).permit(:name, :email, :phone, :message)
    end
end
