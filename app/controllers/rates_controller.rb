class RatesController < ApplicationController

  def new
  end 

  def create
    zipcode = Zipcode.find_by(code: params[:zipcode])
    location = Location.find(zipcode.location_id)
    code = Code.find_by(code: params[:procedure_code])

    bill = Bill.new({
      location_id: location.id,
      dos: params[:dos],
      hospital: params[:hospital]
      })

    @bill_code = BillCode.new({
      bill_id: bill.id,
      code_id: code.code,
      amt_billed: params[:amt_billed]
      })

    @amount = Amount.find_by(code_id: code.id, location_id: location.id)

  end 



end
