class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    encrypt = 0
    self.each.with_index do |num, idx|
      encrypt = encrypt ^ (num.hash * idx)
    end
    encrypt
  end
end

class String
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    encrypt = 0
    self.sort.each do |pair|
      pair.each do |elem|
        encrypt ^= elem.hash
      end
    end  
    encrypt
  end
  
end
