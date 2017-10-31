class UsersController < ApplicationController
  
  def new
    npi = params[:npi]
    provider = Unirest.get("https://api.betterdoctor.com/2016-03-01/doctors/npi/#{npi}?user_key=#{ENV['BETTER_DOCTOR_KEY']}").body

    @image = provider["data"]["profile"]["image_url"]
    @practice_name = provider["data"]["practices"][0]["name"]
    @first_name = provider["data"]["profile"]["first_name"]
    @last_name = provider["data"]["profile"]["last_name"]
    @credentials = provider["data"]["profile"]["title"]
    # @specialty = provider["data"]["specialties"][0]["name"]
    @phone = provider["data"]["practices"][0]["phones"][0]["number"]
    @address_1 = provider["data"]["practices"][0]["visit_address"]["street"]
    @address_2 = provider["data"]["practices"][0]["visit_address"]["street2"]
    @city = provider["data"]["practices"][0]["visit_address"]["city"] 
    @state = provider["data"]["practices"][0]["visit_address"]["state"]
    @zipcode = provider["data"]["practices"][0]["visit_address"]["zip"]
    @bio = provider["data"]["profile"]["bio"]
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
