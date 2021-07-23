require 'pry-byebug'
##> stock_picker([17,3,6,9,15,8,6,1,10])
##=> [1,4]  # for a profit of $15 - $3 == $12#

@price_list = [17,3,6,9,15,8,6,1,10]
def stock_picker(array)
  @min = array.min
  @max = array.max 
  get_index()
  print_result()
end

def initialize_index
  @max_index  = @price_list.index(@max)
  @min_index = @price_list.index(@min)
end

def get_index
  @best_buy_sell = []
  initialize_index()
  
  reassign_min() # the action needs to happen here with the changing the min
  #the reassign_max function accomodates according to the position of min, so we will always get an acceptable value for max!
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
  remove_list = @price_list
  until (@min_index < @max_index) do
    if (@max_index < @min_index)
      remove_list.delete(@max)
      @max = remove_list.max
      reassign_index(remove_list)
    end
  end
end

def reassign_index(remove_list)
  @max_index = remove_list.index(@max)
  @min_index = remove_list.index(@min)
end

def reassign_min
  remove_list = @price_list

  remove_list.delete(@min)
  @min = remove_list.min
  reassign_index(remove_list)
end

stock_picker(@price_list)