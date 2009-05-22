class EnumerableContext
  
  # Current index into the collection
  attr_accessor :index
  
  # Create with a collection and the index into that collection
  def initialize collection, index
    @collection = collection
    @index = index
  end
  
  # Is current index the first?
  def first?
    index == 0
  end
  
  # Is current index the last?
  def last?
    index == @collection.length - 1
  end
  
  # Returns :first if first?; last if last?; nil otherwise
  def edge
    :first if first?
    :last if last?
    nil
  end
  
  # Returns the next element in the collection; nil if it does not exist
  def next
    last? ? nil : @collection[index + 1]
  end
  
  # Returns the previous element in the collection; nil if it does not exist
  def previous
    first? ? nil : @collection[index - 1]
  end
  
  # Returns true if the next element does not have the same value for <tt>field</tt>
  def next_differs_on? field
    if last?
      nil
    else
      element.send(field) != self.next.send(field) # need to self to differentiate from keyword
    end
  end

  # Returns true if the previous element does not have the same value for <tt>field</tt>
  def previous_differs_on? field
    if first?
      nil
    else
      element.send(field) != previous.send(field)
    end
  end
  
  private
  # Returns the element at the current index
  def element
    @collection[index]
  end
  
end