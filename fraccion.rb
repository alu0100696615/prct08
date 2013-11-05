=begin
***********************************************************
*Practica 6 LPP. Desarrollar una clase fraccion usando Desarrollo Dirigido
por el Comportamiento y la herramienta Rspec.

*Autores:
    Sergio Diaz Gonzalez
    Ivan García Campos

*Comentario cabecera
***********************************************************

=end

# funcion simplificador definida dentro de la clase FRACCION
class Fraccion
  
  #simplificar
  def gcd(u, v)
    u, v = u.abs, v.abs
    while v != 0
      u, v = v, u % v
    end
    u
  end
  
  
  
  #definir variables
  
  attr_reader :a, :b # numerador y denominador
  
  #inicialize
  
  def initialize(a,b)
    #comprobamos que sean de tipo numerico
      raise unless a.is_a?(Numeric)
      raise unless b.is_a?(Numeric)
      
      #denominador distinto de cero
      
      raise unless (b != 0)
      #inicializamos las variables
      
      @a, @b = a, b
  end
  
  #Salida (a/b)
  def to_s
      "#{@a}/#{@b}"
  end
  
  
  #retornamos numerador o denominador
  def numerador
      return @a
  end
  
  def denominador
      return @b
  end
  
  #Conversion modo flotante
  def to_f
	@a.to_f / @b.to_f #conversion
  end
  
  #Son iguales?
  def == (other)
	if(@a == other.numerador) && (@b == other.denominador)
	  return true
	else
	  return false
	end
  end
  
  #Pasar una fraccion a flotante
  
  def abs 
    f= Fraccion.new(@a.abs, @b.abs)
  end
  
  #inversa
  
  def reciprocal	
     f = Fraccion.new(@b, @a)
  end
  
  #opuesto 
  
  def opuesto
     f = Fraccion.new(-@a, @b)
  end
  
  #Suma
  
  def + (other)
      mincomun = @b * other.denominador
      a = @a * other.denominador
      b = other.numerador * @b
      c= a +b
      k = gcd(c,mincomun)
      c /= k
      mincomun/= k
      Fraccion.new(c,mincomun)
  end
     
  #Resta
  
  def - (other)
      mincomun = @b * other.denominador
      a = @a * other.denominador
      b = other.numerador * @b
      c= a - b
      k = gcd(c,mincomun)
      c /= k
      mincomun/= k
      Fraccion.new(c,mincomun)
  end
  
  #Producto 
  def * (other)
      a = @a * other.numerador
      b = @b * other.denominador
      k = gcd(a, b)
      a /= k
      b /= k
      Fraccion.new(a, b)
  end
  
  #División considero | division porque con / no me deja.
  def | (other)
      a = @a * other.denominador
      b = @b * other.numerador
      k = gcd(a, b)
      a /= k
      b /= k
      Fraccion.new(a, b)
  end
  
  #Resto Fracciones
  
  def % (other)
	r = Fraccion.new(0,1)
	r = self
	while (r.to_f >= other.to_f) do ##hasta que no se pueda simplificar mas
	  r = r- other
	end
	return r
  end
  
  #Comprobaciones
  
  #Comprobar si una fraccion es mayor que la otra
   def > (other)	
      if (self.to_f > other.to_f)
          return true
      else
	  return false
      end
    end
         
   #Comprobar si es menor
    def < (other)	
      if (self.to_f < other.to_f)
          return true
      else
	  return false
      end
    end     
     
   #Comprobar si es mayor o igual que la otra
         
    def >= (other)	
      if (self.to_f >= other.to_f)
          return true
      else
	  return false
      end
    end
   
    #Comprobar si es menor o igual
    def <= (other)	
      if (self.to_f <= other.to_f)
          return true
      else
	  return false
      end
    end

    #*******************************************************************************
    #PUTS para mostrar algunos ejemplos
#     
#     a= Fraccion.new(2,5)
#     puts "#{a}"
# 
#     b= Fraccion.new(8,2)
#     puts "#{b}"
# 
#     c= a* b
#     puts "#{c}"
# 
#     c= a| b
#     puts "#{c}"
# 
#     c= a+ b
#     puts "#{c}"
# 
#     c= a- b
#     puts "#{c}"


end