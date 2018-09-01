class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1) { false }
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true if num <= @max
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % @store.length
    @store[idx] << num 
  end

  def remove(num)
    idx = num % @store.length
    @store[idx].delete(num) 
  end

  def include?(num)
    idx = num % @store.length
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if include?(num)
    idx = num % num_buckets 
    @store[idx] << num
    @count += 1
    resize! if @count == num_buckets
  end

  def remove(num)
    idx = num % num_buckets
    if include?(num)
      @store[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % num_buckets 
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |buckett|
      buckett.each do |value|
        idx = value % new_store.length
        new_store[idx] << value
      end
    end
    @store = new_store
  end
end
