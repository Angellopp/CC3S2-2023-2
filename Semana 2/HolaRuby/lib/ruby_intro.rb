# Parte 1

def sum arr
  ans = 0
  arr.each do |num|
    ans += num
  end
  ans
  # return arr.reduce(0, :+)
end

def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  sorted_arr = arr.sort.reverse
  sorted_arr[0] + sorted_arr[1]
end

def sum_to_n? arr, n
  return false if arr.empty?
  return false if arr.length == 1
  sarr = arr.sort
  arr.each do |num|
    if arr.include?(n - num) && (n - num != num)
      return true
    end 
  end
  return false
end

# Parte 2

def hello(name)
  return "Hello, #{name}"
end

def starts_with_consonant? s
  if s =~ /^[a-z]/i && !(s =~ /^[aeiou]/i)
    return true
  end
  return false
end

def binary_multiple_of_4? s
  if s =~ /^[01]+$/ && (s =~ /00?\z/)
    return true
  end
  return false
end

# Parte 3

class BookInStock
  attr_accessor :isbn, :price
  def initialize(isbn, price)
    if isbn.empty? || price <= 0
      return raise ArgumentError
    end
    @isbn = isbn
    @price = price
  end

  def price_as_string
    "$#{format('%.2f', @price)}"
  end

end
