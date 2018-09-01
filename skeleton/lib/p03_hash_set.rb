class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    idx = key.hash % num_buckets
    return if @store[idx].include?(key)
    @store[idx] << key 
    @count += 1
    resize! if @count == @store.length
  end

  def include?(key)
    idx = key.hash % num_buckets
    @store[idx].include?(key)
  end

  def remove(key)
    idx = key.hash % num_buckets
    return unless @store[idx].include?(key)
    @store[idx].delete(key) if @store[idx].include?(key)
    @count -= 1
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
      buckett.each do |elem|
        idx = elem.hash % new_store.length
        new_store[idx] << elem
      end
    end
    @store = new_store
  end
  
end
