class Mobile < ApplicationRecord

  def send_message
    o = open("http://transsms.crazybulksms.com/submitsms.jsp?user=CLASSPRO&key=7e0920d7bbXX&mobile=#{number.to_i}&message=#{message} sms&senderid=abcdef&accusage=1")
    arr = o.read.to_s.split(",")
    puts arr.inspect
    History.create(phone: number, message: message, status: arr[1])
  end
end
