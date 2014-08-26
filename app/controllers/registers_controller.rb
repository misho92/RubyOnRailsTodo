class RegistersController < ApplicationController
  
  require 'digest/sha1'
  
  def post
    @user = User.create(password: Digest::SHA1.hexdigest(request.POST["pass"]))
    Account.create(title: request.POST["title"], first_name: request.POST["firstName"], last_name: request.POST["lastName"], company: request.POST["company"], 
    email: request.POST["email"], user_id: @user.id)
    if request.POST["payment"] == "Credit Card"
      Portal.create(payment: request.POST["payment"], name_on_card: request.POST["nameOnCard"], card_number: request.POST["cardNumber"], 
      CVC: request.POST["cvc"], valid_until: request.POST["validUntil"], plan: request.POST["plan"], registered: Date.today, user_id: @user.id)
    else
      Portal.create(payment: request.POST["payment"], owner_of_account: request.POST["ownerOfAccount"], BIC: request.POST["BIC"], IBAN: request.POST["IBAN"], 
      bank_account_number: request.POST["bankAccountNumber"], plan: request.POST["plan"],registered: Date.today, user_id: @user.id)
    end
    if @user.save
      render :json => @user
    end    
  end
  
end
