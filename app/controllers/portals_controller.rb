class PortalsController < ApplicationController
  
  def index
    render json: Portal.all
  end
  
  def put
    @portal = Portal.find_by(user_id: 1)
    if request.params()["plan"] == "S"
      if Date.parse(@portal.registered) < Date.tomorrow
        @portal.update(plan: request.params()["plan"])
      end
    elsif request.params()["plan"] == "L"
      if Date.parse(@portal.registered) < Date.tomorrow
        @portal.update(plan: request.params()["plan"])
      end
    elsif request.params()["plan"] == nil
      @portal.update(plan: "")
    elsif request.params()["payment"] == "Credit Card"
      @portal.update(name_on_card: request.params()["nameOnCard"], card_number: request.params()["cardNumber"], CVC: request.params()["cvc"], 
      valid_until: request.params()["validUntil"])
    else    
      @portal.update(owner_of_account: request.params()["owner"], BIC: request.params()["BIC"], IBAN: request.params()["IBAN"], 
      bank_account_number: request.params()["bankAccountNumber"])
    end
    if @portal.save
      render :json => @portal
    end
  end
  
end
