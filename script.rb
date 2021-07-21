require 'pry-byebug'
##> stock_picker([17,3,6,9,15,8,6,1,10])
##=> [1,4]  # for a profit of $15 - $3 == $12#

@price_list = [17,3,6,9,15,8,6,1,10]
def stock_picker(array)
  @min = array.min
end

