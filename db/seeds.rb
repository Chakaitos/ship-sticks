# Reading products.json file to seed the DB

json = File.read('./products.json')
hash = JSON.parse(json)

hash['products'].each do |p|
  puts "Starting #{p['name']}"
  Product.find_or_create_by(p)
end
