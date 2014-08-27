class AccountsController < ApplicationController
  
  def index
    render json: Member.find_by(id: current_member.id)
  end
  
  def put
    @member = Member.find_by(id: current_member.id)
    @member.update(title: request.params()["title"], first_name: request.params()["firstName"], last_name: request.params()["lastName"], 
    company: request.params()["company"], email: request.params()["email"])
    if @member.save
      render :json => @member
    end
  end
  
end
