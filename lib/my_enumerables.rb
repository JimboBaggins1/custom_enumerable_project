module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    index_result = []
    x = 0
    for i in self do
      index_result << block.call(i, x)
      x += 1
    end
    self
  end

  def my_select(&block)
    result = []
    self.my_each do |elem|
      result << elem if block.call(elem) == true
    end
    result
  end

  def my_all?(&block)
    result = []
    self.my_each do |elem|
      result << elem if block.call(elem) == true
    end
    if result.length == self.length
      true
    else
      false
    end
  end

  def my_any?(&block)
    result = []
    self.my_each do |elem|
      result << elem if block.call(elem) == true
    end
    result.empty? ? false : true
  end

  def my_none?(&block)
    self.my_any?(&block) ? false : true
  end

  def my_count(&block)
    count = 0
    self.my_each do |elem|
      if block_given?
        count += 1 if block.call(elem) == true
      else
        count += 1
      end
    end
    count
  end

  def my_map(&block)
    result = []
    self.my_each do |elem|
      result << block.call(elem)
    end
    result
  end

  def my_inject(initial_value = 0, &block)
    result = initial_value
    self.my_each do |elem|
      result = block.call(result, elem)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    result = []
    for i in self do
      result << block.call(i)
    end
    self
  end

end
