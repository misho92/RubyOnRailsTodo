class AccountsController < ApplicationController
  
  # rendering json
  def index
    render json: [Member.find_by(id: current_member.id)]
  end
  
  # put request for editing the account data
  def put
    @member = Member.find_by(id: current_member.id)
    @member.update(title: request.params()["editedUser"]["editedTitle"], first_name: request.params()["editedUser"]["editedFirstName"], 
    last_name: request.params()["editedUser"]["editedLastName"], company: request.params()["editedUser"]["editedCompany"], 
    email: request.params()["editedUser"]["editedEmail"])
    if @member.save
      render :json => [@member]
    end
  end
  
end
