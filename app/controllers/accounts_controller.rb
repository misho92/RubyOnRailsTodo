class AccountsController < ApplicationController
  
  def index
    render json: Account.all
  end
  
  def put
    @account = Account.find_by(id: 1)
    @account.update(title: request.params()["title"], first_name: request.params()["firstName"], last_name: request.params()["lastName"], 
    company: request.params()["company"], email: request.params()["email"])
    if @account.save
      render :json => @account
    end
  end
  
end
