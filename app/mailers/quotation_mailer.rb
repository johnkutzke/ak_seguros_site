class QuotationMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  default from: "john.kutzke.cwb@gmail.com"

  def quotation_email(quotation)
    @quotation = quotation
    mail(to: "john.kutzke.cwb@gmail.com", subject: 'AK Seguros - Orçamento solicitado')
  end
end
