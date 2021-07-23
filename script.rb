require 'pry-byebug'
##> stock_picker([17,3,6,9,15,8,6,1,10])
##=> [1,4]  # for a profit of $15 - $3 == $12#

@price_list = [17,3,6,9,15,8,6,1,10]
def stock_picker(array)
  
  @min = array.min
  @max = array.max
  print_result()
  
  get_index()
end

def initialize_index
  @max_index  = @price_list.index(@max)
  @min_index = @price_list.index(@min)
end

def get_index
  @best_buy_sell = []
  initialize_index()
  
  reassign_max()
  @price_list.each_index do |price_index|
    case price_index
    when @min_index
      @best_buy_sell.append(price_index)
    when @max_index
      @best_buy_sell.append(price_index)
    end
  end
  
  @best_buy_sell

end


def print_result
  puts "The profit is #{@max} - #{@min} = #{@max-@min}."
end



def reassign_max
  binding.pry
  remove_list = @price_list
  until (@min_index < @max_index) do
    if (@max_index < @min_index)
      remove_list.delete(@max)
      @max = remove_list.max
      @max_index = remove_list.index(@max)
      @min_index = remove_list.index(@min)
    end
  end
end



stock_picker(@price_list)