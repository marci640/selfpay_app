class UsersController < ApplicationController
  
  def new
    npi = params[:npi]
    provider = Unirest.get("https://www.bloomapi.com/api/sources/usgov.hhs.npi/#{npi}").body
    @first_name = provider["result"]["first_name"].titlecase
    @last_name = provider["result"]["last_name"].titlecase
    @credential = provider["result"]["credential"]
    @address = provider["result"]["business_address"]["address_line"].titlecase + ", " + provider["result"]["business_address"]["address_details_line"].titlecase
    @city = provider["result"]["business_address"]["city"].titlecase
    @state = provider["result"]["business_address"]["state"]
    @zipcode = provider["result"]["business_address"]["zip"].slice(0,5)
    @phone = provider["result"]["business_address"]["phone"]
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
