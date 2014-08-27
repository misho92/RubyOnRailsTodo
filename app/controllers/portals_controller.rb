class PortalsController < ApplicationController
  
  def index
    @portal = Portal.find_by("user_id = " + current_member.id.to_s)
    @member = Member.find_by(id: current_member.id)
      render :json => {
        :portal => @portal,
        :member => @member
      }
  end
  
  def put
    @portal = Portal.find_by(user_id: current_member.id)
    @member = Member.find_by(id: current_member.id)
    if request.params()["plan"] == "S"
      if Date.parse(@portal.registered) < Date.tomorrow
        @portal.update(plan: request.params()["plan"])
        @member.update(plan: request.params()["plan"])
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
      render :json => @portal
    end
  end
  
end
