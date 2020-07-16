# frozen_string_literal: true

def prueba saludate, goodbye
    "#{saludate}, #{goodbye}\n"
  end

  def prueba2
    print "Hola\n"
  end
  
  def function_raise
    raise 'error'
  end
  
  def suma num1, num2
    (num2.to_i + num1.to_i)
  end

  def suma_a array
    array = array.split(',')
    total = 0
    array.each do |num|
      total += num.to_i
    end
    total
  end
