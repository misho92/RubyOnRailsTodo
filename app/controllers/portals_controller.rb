class PortalsController < ApplicationController
  require "date"
  def index
    @portal = Portal.find_by("user_id = " + current_member.id.to_s)
    @member = Member.find_by(id: current_member.id)
    puts Date.strptime(@portal.registered, "%Y-%m-%d").strftime("%s")
    puts Date.today.strftime("%s")
      render :json => {
        :portal => @portal,
        :member => @member
      }
  end
  
  def put
    @portal = Portal.find_by(user_id: current_member.id)
    @member = Member.find_by(id: current_member.id)
    if request.params()["plan"] == "S"
      # 604800 is the number of seconds in a week, if the request is valid ( within 7 days of the registration let the downgrade proceed
      if (Date.today.strftime("%s").to_i - 604800) <= Date.strptime(@portal.registered, "%Y-%m-%d").strftime("%s").to_i
        @portal.update(plan: request.params()["plan"])
        @member.update(plan: request.params()["plan"])
        flag = true
      end
    elsif request.params()["plan"] == "L"
      if Date.parse(@portal.registered) < Date.tomorrow
        @portal.update(plan: request.params()["plan"])
        @member.update(plan: request.params()["plan"])
      end
    elsif request.params()["payment"] == "Credit Card"
      @portal.update(payment: "Credit Card", name_on_card: request.params()["nameOnCard"], card_number: request.params()["cardNumber"], CVC: request.params()["cvc"], 
      valid_until: request.params()["validUntil"])
    elsif request.params()["payment"] == "Direct Debit"
      @portal.update(payment: "Direct Debit", owner_of_account: request.params()["owner"], BIC: request.params()["BIC"], IBAN: request.params()["IBAN"], 
      bank_account_number: request.params()["bankAccountNumber"])
    else
      @portal.update(plan: "")
      @member.update(plan: "")
    end
    if @portal.save
      if flag == true
        render :json => {
        :portal => @portal,
        :success => true
      }
      else
        render :json => @portal  
      end
    end
  end
  
end
