class Api::V1::ProvidersController < ApplicationController

  def index
    @providers = User.where(active: true)
    render 'index.json.jbuilder'
  end

end
