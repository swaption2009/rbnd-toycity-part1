require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
time = Time.now
puts time.strftime("Printed on %m/%d/%Y")

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

# For each product in the data set:
products_hash["items"].each do |product|

  # Print the name of the toy
  puts "Product name: " + product["title"]

  # Print the retail price of the toy
  puts "Retail price: $" + product["full-price"]

  # Calculate and print the total number of purchases
  puts "Total number of purchases: " + product["purchases"].count.to_s

  # Calculate and print the total amount of sales
  sales = 0
  product["purchases"].each do |price|
    sales += price["price"]
  end
  puts "Total amount of sales: $" + sales.to_s

  # Calculate and print the average price the toy sold for
  average_price = sales/product["purchases"].count
  puts "Average price: $" + average_price.to_s

  # Calculate and print the average discount (% or $) based off the average sales price
  average_discount = ( product["full-price"].to_i - average_price ) / product["full-price"].to_i * 100
  puts "Average discount: " + average_discount.round(2).to_s + "%"

  #add line divider
  50.times { print "_" }
  puts
end

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:

  # Print the name of the brand
  brands = []
  products_hash["items"].each do |product|
    brands << product["brand"] unless brands.include? product["brand"]
  end
  puts "There are " + brands.count.to_s + " brands. They are: " + brands.to_s

  #add line divider
  65.times { print "_" }
  puts

  brands.each do |brand|
    brand_stock = 0
    brand_price = 0
    brand_revenue = 0
    brand_qty_sold = 0

    products_hash["items"].each do |product|
      if product["brand"] == brand
        brand_stock += product["stock"]
        product["purchases"].each do |purchase|
          brand_qty_sold += 1
          brand_revenue += purchase["price"]
        end
      end
    end
    # Count and print the number of the brand's toys we stock
    puts brand.to_s + " has " + brand_stock.to_s + " quantities in stock"
    # Calculate and print the average price of the brand's toys
    puts "The average price for " + brand + " brand is: $" + (brand_revenue / brand_qty_sold).round(2).to_s
    # Calculate and print the total revenue of all the brand's toy sales combined
    puts "The store has sold " + brand + " brand for a total of: $" + brand_revenue.round(2).to_s
    #add line divider
    65.times { print "_" }
    puts
  end