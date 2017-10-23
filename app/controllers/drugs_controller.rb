class DrugsController < ApplicationController
  def index 
    # @drugs = Unirest.get("https://rxnav.nlm.nih.gov/REST/displaynames.json").body
  end 
end
