class QuestionMailer < ApplicationMailer
  default from: "john.kutzke.cwb@gmail.com"

  def question_email(question)
    @question = question
    mail(to: "john.kutzke.cwb@gmail.com", subject: 'AK Seguros - Contato pelo site')
  end
end
