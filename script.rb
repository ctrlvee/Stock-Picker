require 'pry-byebug'
##> stock_picker([17,3,6,9,15,8,6,1,10])
##=> [1,4]  # for a profit of $15 - $3 == $12#

@price_list = [17,3,6,9,15,8,6,1,10]
def stock_picker(array)
 
  @min = array.min
  @max = array.max
  print_result
  get_index()
end

def get_index
  @best_buy_sell = []
  @price_list.each_index do |price_index|
    case price_index
    when @price_list.index(@min)
      @best_buy_sell.append(price_index)
    when @price_list.index(@max)
      @best_buy_sell.append(price_index)
    end
  end
  @best_buy_sell
  binding.pry
end


def print_result
  puts "The profit is #{@max} - #{@min} = #{@max-@min}."
end

stock_picker(@price_list)