class RegistrationController < Devise::RegistrationsController

  def new
    @member= Member.new
  end
  
  # the registation controller which overrides the default devise one
  def create
    @member = Member.new
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.password_confirmation = params[:member][:password_confirmation]
    @member.first_name = params[:member][:first_name]
    @member.last_name = params[:member][:last_name]
    @member.company = params[:member][:company]
    @member.title = params[:title]
    @member.plan = params[:plan]
    @portal = Portal.new
    @portal.paymentMethod = params[:paymentMethod]
    @member.valid?
    if @member.errors.blank?
      if @member.save 
        @portal.user_id = @member.id
        @portal.plan = params[:plan]
        @portal.registered = Time.now.strftime("%d-%m-%Y")
        @portal.save
        return redirect_to new_member_session_path
      end
    else
      render :action => "new"
    end
  end
  
  def sign_up_params
    params.require(:member).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end