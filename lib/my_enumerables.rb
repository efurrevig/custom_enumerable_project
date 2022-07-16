module Enumerable

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    
    j=0
    for i in self
      yield i, j
      j += 1
    end
  end 

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each {|elem| result.push(elem) if yield elem}
    result
  end

  def my_all?
    return to_enum(my_all?) unless block_given?

    my_each {|elem| return false if not yield elem}
    true

  end

  def my_any?
    return to_enum(my_any?) unless block_given?

    my_each {|elem| return true if yield elem}
    false
  end

  def my_none?
    return to_enum(my_none?) unless block_given?

    my_each {|elem| return false if yield elem}
    true
  end

  def my_count
    return length unless block_given?

    i = 0
    my_each {|elem| i += 1 if yield elem}
    return i
  end

  def my_map
    return to_enum(my_map) unless block_given?

    return_array = []
    my_each {|elim| return_array.push(yield(elim))}
    return_array
  end

  def my_inject(initial_value)
    return to_enum(my_inject) unless block_given?

    result = initial_value
    my_each {|elim| result = yield(result, elim)}
    result

  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  def my_each
    return to_enum(:my_each) unless block_given?

    for i in self
      yield i
    end
  end

end
