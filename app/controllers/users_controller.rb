class UsersController < ApplicationController
  
  def new
    npi = params[:npi]
    @provider = BloomApi.find_by_npi(npi)
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      credential: params[:credential],
      phone: params[:phone],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      email: params[:email],
      specialty: params[:specialty],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to "/providers/#{user.id}"
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

end
