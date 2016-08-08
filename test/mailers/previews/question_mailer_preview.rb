# Preview all emails at http://localhost:3000/rails/mailers/question_mailer
class QuestionMailerPreview < ActionMailer::Preview
  def question_mail_preview
    question = Question.new
    question.name = "Nome da pessoa"
    question.email = "abs@abs.com"
    question.phone = "(41) 9975-9127"
    question.message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id porta tellus. Aliquam pretium, mauris eu ultricies feugiat, dolor leo convallis erat, id porttitor neque metus ut sapien. Nulla et sollicitudin risus. Pellentesque habitant morbi metus."
    QuestionMailer.question_email(question).deliver
  end
end
