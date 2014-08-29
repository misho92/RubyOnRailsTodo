class PortalsController < ApplicationController
  require "date"
  
  # rendering json
  def index
    @portal = Portal.find_by("user_id = " + current_member.id.to_s)
    @member = Member.find_by(id: current_member.id)
      render :json => {
        :portal => [@portal],
        :member => [@member]
      }
  end
  
  # upgrading, downgrading (only possible within 7 days of registration), cancel plan, or edit payment data
  def put
    @portal = Portal.find_by(user_id: current_member.id)
    @todos = Todo.where("user_id = " + current_member.id.to_s)
    @member = Member.find_by(id: current_member.id)
    if request.params()["plan"] == "S"
      # 604800 is the number of seconds in a week, if the request is valid ( within 7 days of the registration let the downgrade proceed
      if (Date.today.strftime("%s").to_i - 604800) <= Date.strptime(@portal.registered, "%d-%m-%Y").strftime("%s").to_i
        @portal.update(plan: request.params()["plan"])
        @member.update(plan: request.params()["plan"])
        flag = true
      end
    elsif request.params()["plan"] == "L"
      if Date.parse(@portal.registered) < Date.tomorrow
        @portal.update(plan: request.params()["plan"])
        @member.update(plan: request.params()["plan"])
      end
    elsif request.params()["editedPortal"]["paymentMethod"] == "Credit Card"
      validUntil = request.params()["editedPortal"]["month"].to_s + "/" + request.params()["editedPortal"]["year"].to_s
      @portal.update(paymentMethod: "Credit Card", nameOnCard: request.params()["editedPortal"]["nameOnCard"], 
      cardNumber: request.params()["editedPortal"]["cardNumber"], CVC: request.params()["editedPortal"]["CVC"], validUntil: validUntil)
    elsif request.params()["editedPortal"]["paymentMethod"] == "Direct Debit"
      @portal.update(paymentMethod: "Direct Debit", accountOwner: request.params()["editedPortal"]["accountOwner"], BIC: request.params()["editedPortal"]["BIC"], 
      IBAN: request.params()["editedPortal"]["IBAN"], bankNo: request.params()["editedPortal"]["bankNo"])
    else
      @portal.update(plan: "")
      @member.update(plan: "")
      @todos.destroy_all
    end
    if @portal.save
      if flag == true
        render :json => {
          :success => true,
          :portal => @portal
      }
      else
        render :json => @portal  
      end
    end
  end
  
end
