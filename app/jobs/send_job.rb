class SendJob < ApplicationJob
  queue_as :sms

  def perform(no, message)
    # o = open("http://transsms.crazybulksms.com/submitsms.jsp?user=CLASSPRO&key=7e0920d7bbXX&mobile=#{no.to_i}&message=#{text} sms&senderid=abcdef&accusage=1")
    # arr = o.read.to_s.split(",")
    # puts arr.inspect

    arr = ['sent','success']
    History.create(phone: no.to_i, message: message, status: arr[1])
  end
end
