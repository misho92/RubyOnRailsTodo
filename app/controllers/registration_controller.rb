class RegistrationController < Devise::RegistrationsController

  def new
    @member= Member.new
  end
  
  def create
    @member = Member.new
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.password_confirmation = params[:member][:password_confirmation]
    @member.first_name = params[:member][:first_name]
    @member.valid?
    if @member.errors.blank?
      @member.save
    else
      render :action => "new"
    end
  end
  
  def sign_up_params
    params.require(:member).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end