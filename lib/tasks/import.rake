require 'csv'

namespace :import do 
  desc "Import data from csv"
  task locations: :environment do 
    filename = File.join Rails.root, "locations.csv"
    CSV.foreach(filename, headers: true) do |row|
      Location.create({
    id: row[0],
    carrier: row[1],
    locality: row[2]
        })
    end
  end 
end 

namespace :import do 
  desc "Import data from csv"
  task codes: :environment do 
    filename = File.join Rails.root, "codes.csv"
    CSV.foreach(filename, headers: true) do |row|
      Code.create({
    id: row[0],
    code: row[1]
        })
    end
  end 
end 

namespace :import do 
  desc "Import data from csv"
  task zipcodes: :environment do 
    filename = File.join Rails.root, "zipcodes.csv"
    CSV.foreach(filename, headers: true) do |row|
      Zipcode.create({
    location_id: row[0],
    code: row[1]
        })
    end
  end 
end 

namespace :import do 
  desc "Import data from csv"
  task amounts: :environment do 
    filename = File.join Rails.root, "amounts.csv"
    CSV.foreach(filename, headers: true) do |row|
      Amount.create({
    id: row[0],
    code_id: row[1],
    location_id: row[2],
    facility_fee: row[3],
    non_facility_fee: row[4]
        })
    end
  end 
end 