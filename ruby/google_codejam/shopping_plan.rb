# shopping_plan.rb
#                           wookay.noh at gmail.com

def translate data
  #puts data[:items]
  #puts data[:stores]
  #puts data[:price_of_gas]
  data
end

def feed_rule
  lambda do |feed|
    num_items, num_stores, price_of_gas = feed.readline.split ' '
    items = feed.readline.split ' '
    stores = num_stores.to_i.times.map do
      x_pos, y_pos, *item_prices = feed.readline.split ' '
      item_hash = Hash[
        item_prices.map do |item_price|
          item, price = item_price.split ':'
          [item, price.to_i]
        end
      ]
      [x_pos.to_i, y_pos.to_i, item_hash]
    end
    { :items => items, :stores => stores, :price_of_gas => price_of_gas.to_i }
  end
end

if __FILE__ == $0
  require 'jam'
  jam = Jam.new
  jam.feed feed_rule do |case_num, data|
    puts [:data, data].inspect
    puts "Case ##{case_num}: #{translate data}"
  end
end
