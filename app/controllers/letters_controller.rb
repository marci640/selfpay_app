class LettersController < ApplicationController

  def create
    @codes = []
    index = 1
    8.times do 
      if params[:"table_row#{index}"]
        @codes << params[:"table_row#{index}"]
      end
    end
  end 
    
    

 
end
