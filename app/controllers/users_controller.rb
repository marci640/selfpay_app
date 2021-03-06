class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:new, :create]

  def new
    # BloomAPI gem has it's own methods for getting address, etc. If found, add input values to new provider form to save time. NPI must be individual 
    npi = params[:npi]
    provider = BloomApi.find_by_npi(npi)
    @user = User.new 
    if provider && provider.type == 'individual'
      @user.first_name = provider.first_name.titleize 
      @user.last_name = provider.last_name.titleize
      @user.credential = provider.credential
      @user.phone = provider.business_address.phone
      @user.address_1 = provider.business_address.line1.titleize
      @user.address_2 = provider.business_address.line2
      @user.city = provider.business_address.city.titleize
      @user.state = provider.business_address.state
      @user.zipcode = provider.business_address.zip.slice(0,5)
    else 
      flash[:warning] = 'Invalid NPI - Please complete form'
    end 
  end

  def create
    user = User.new(
      first_name: params[:first_name].titleize,
      last_name: params[:last_name].titleize,
      credential: params[:credential],
      phone: params[:phone],
      address_1: params[:address_1].titleize,
      address_2: params[:address_2].titleize,
      city: params[:city].titleize,
      state: params[:state],
      zipcode: params[:zipcode],
      active: params[:active],
      email: params[:email],
      specialty: params[:specialty],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to "/users/#{user.id}"
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/providers/new'
    end
  end 

  def show
    @user = User.find(params[:id])
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      credential: params[:credential],
      phone: params[:phone],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      specialty: params[:specialty],
      email: params[:email],
      active: params[:active]
    )
    if user.save
      flash[:info] = "User successfully updated."
      redirect_to "/users/#{user.id}"
    else 
      render :edit
    end 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:warning] = "Account succesfully deleted."
    redirect_to "/providers/new"
  end 

end
