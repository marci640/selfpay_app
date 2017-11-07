json.array! @providers.each do |provider|
  json.id provider.id
  json.last_name provider.last_name
  json.first_name provider.first_name
  json.credential provider.credential
  json.phone provider.phone
  json.address_1 provider.address_1
  json.address_2 provider.address_2
  json.city provider.city
  json.state provider.state
  json.zipcode provider.zipcode
  json.specialty provider.specialty
end 



