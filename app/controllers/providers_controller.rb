class ProvidersController < ApplicationController
  
  def index
    @key = ENV["ZIPCODE_API_KEY"];
  end

  def new
  end

  def create
    zipcode = Zipcode.find_by(code: params[:zipcode])
    location = Location.find(zipcode.location_id) 

    codes_array = []
    selfpay_amounts = []
    
    # If there's a cpt code, perform a lookup, add 15%, put data in array for table view on next view. If code not available, assign 7193 (unavailable cpt)
    index = 1
    8.times do 
      if params[:"procedure_code#{index}"] != "" 
        code = Code.find_by(code: params[:"procedure_code#{index}"])
        if code == nil
          code = Code.find(7193)
          amount = Amount.find_by(code_id: code.id, location_id: 0)
        else 
          amount = Amount.find_by(code_id: code.id, location_id: location.id).non_facility_fee
          selfpay_amount = amount += amount % 15
        end 
      codes_array << code
      selfpay_amounts << selfpay_amount
      end
      index += 1 
    end
    @arrays = codes_array.zip(selfpay_amounts)
  end 

end
