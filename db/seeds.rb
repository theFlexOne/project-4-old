require "faker"

puts "Now seeding. Please be patient..."

SERVICES = [
  { name: "Haircut", price: 15, active: true, description: "Your standard adult haircut" },
  { name: "Child's Haircut", price: 10, active: true, description: "Your standard child's haircut" },
  { name: "All-Over Color", price: 25, active: true, description: "Single all-over color" },
  { name: "Highlights", price: 35, active: true, description: "Highlight" },
  { name: "Blow Out", price: 45, active: true, description: "Basic blow out" },
  { name: "Formal Styling", price: 65, active: true, description: "Fancy styling for formal occasions (wedding, prom, etc.)" },
]

conditioner_types = ["Thickening", "Deep", "Moisturizing", "Protein", "Cream Rinse", "Instant", "Leave-in"]
shampoo_types = ["Regular", "Dry", "Anti-breakage", "Purifying", "Clarifying", "Moisturizing", "Volumizing", "Color-treated", "Curly Hair"]

PRODUCTS = [
  *conditioner_types.map { |t| { name: "#{t} Conditioner", price: 15, active: true, description: "A #{t} conditioner" } },
  *shampoo_types.map { |t| { name: "#{t} Shampoo", price: 20, active: true, description: "A #{t} shampoo" } },
  { name: "Hairspray", price: 12, active: true, description: "Bed Head " },

]

def barber_params
  {
    name: Faker::Name.name,
    start_date: Faker::Date.backward(Random.rand(180) + 1),
    wage: (Random.rand(7.50) + 7.50).truncate(2),
    station: Random.rand(6) + 1,
  }
end

def client_params
  {
    name: Faker::Name.name,
    regular_barber: Random.rand(Barber.count) + 1,
  }
end

10.times do |i|
  Barber.create barber_params
end

100.times do |i|
  Client.create client_params
end

SERVICES.each do |service|
  Service.create service
end

PRODUCTS.each do |product|
  Product.create product
end

puts "Seeding has successfully completed"