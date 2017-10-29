class UsersController < ApplicationController
  
  def new
    @npi = params[:npi]
    # @provider = Unirest.get("https://npiregistry.cms.hhs.gov/api?number=1477565794").body
    render 'new.html.erb'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

end
