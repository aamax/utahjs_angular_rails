json.array!(@classifieds) do |ad|
  json.name           ad.name
  json.description    ad.description
  json.phone          ad.phone
  json.seller         ad.seller
  json.price          ad.price
  json.image          ad.image
end