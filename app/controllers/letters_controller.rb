class LettersController < ApplicationController

  def index
  end 
  
  def create
    # lookup the bill_id that was submitted on previous page 
    bill = Bill.find(params[:bill_id])
    @dos = bill.dos
    hospital = bill.hospital 
    
    # remove USA from hospital address 
    @hospital_address = hospital.split(', ')
    @hospital_address.pop
    
    
    # check if info from table row is checked then add to array (originally a string before split)
    @all_data = []
    index = 0
    8.times do 
      if params[:"table_row#{index}"]
        @all_data << params[:"table_row#{index}"].split(',')
        index += 1
      end 
    end 
  end     
 
end
