class LettersController < ApplicationController

  def index
  end 
  
  def create
    # bill = Bill.find(params[:bill_id])
    # @dos = bill.dos
    # @hospital = bill.hospital 
    
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
