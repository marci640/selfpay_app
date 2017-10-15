class RatesController < ApplicationController
  
  def new 
    
  end 

  def create
    zipcode = Zipcode.find_by(code: params[:zipcode])
    location = Location.find(zipcode.location_id)

    @bill = Bill.new(
      location_id: location.id,
      dos: params[:dos],
      hospital: params[:hospital]
      )
    codes_array = []
    hospital_amounts = []
    amounts_array = []
    
    index = 1
    8.times do 
      if params[:"procedure_code#{index}"] != "" 
        code = Code.find_by(code: params[:"procedure_code#{index}"])
        amt_billed = params[:"amt_billed#{index}"]
        amount = Amount.find_by(code_id: code.id, location_id: location.id)

        BillCode.new(
          bill_id: @bill.id,
          code_id: code.id,
          amt_billed: amt_billed
        )
        codes_array << code
        hospital_amounts << amt_billed
        amounts_array << amount 
      end
      index += 1 
    end
    @arrays = [codes_array, hospital_amounts, amounts_array].transpose.each { |x, y, z| p [x, y, z] }
  end 

end
