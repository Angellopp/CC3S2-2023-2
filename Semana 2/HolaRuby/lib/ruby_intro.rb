# Parte 1

## Iteramos por el arreglo y sumamos todos los elementos en ans y devolvemos ans
def sum arr
  ans = 0
  arr.each do |num|
    ans += num
  end
  return ans
end

## Ordenamos el arreglo de mayor a menor y devolvemos la suma de los 2 primeros elementos 
def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  sorted_arr = arr.sort.reverse
  sorted_arr[0] + sorted_arr[1]
end

## Iteramos por el arreglo y verificamos si el numero (n - num) esta en el arreglo 
def sum_to_n? arr, n
  return false if arr.empty?
  return false if arr.length == 1
  arr.each do |num|
    if arr.include?(n - num) && (n - num != num)
      return true
    end 
  end
  return false
end

# Parte 2

## Añadimos el string "Hello, " a la variable name
def hello(name)
  return "Hello, #{name}"
end

## Verificamos si la cadena empieza con una letra minuscula o mayuscula (s =~ /^[a-z]/i) y no con una vocal (s =~ /^[aeiou]/i)
def starts_with_consonant? s
  if s =~ /^[a-z]/i && !(s =~ /^[aeiou]/i)
    return true
  end
  return false
end

## Verificamos si la cadena es binaria (s =~ /^[01]+$/) y la cadena termina con "00" (s =~ /00\z/)) o es "0"
def binary_multiple_of_4? s
  if (s =~ /^[01]+$/ && (s =~ /00\z/)) || s == '0'
    return true
  end
  return false
end

# Parte 3

## Creamos la clase BookInStock  
class BookInStock
  attr_accessor :isbn, :price ## Creamos sus getters y setters (attr_accessor :isbn, :price)
  
  ## Creamos el metodo constructor
  def initialize(isbn, price)
    if isbn.empty? || price <= 0 ## Verificamos que los parametros sean correctos y lanzamos un Argumenterror
      return raise ArgumentError
    end
    @isbn = isbn
    @price = price
  end

  ## Creamos el metodo price_as_string y devolvemos price formatado con dos decimales y '$' en el inicio 
  def price_as_string
    "$#{format('%.2f', @price)}"
  end

end
