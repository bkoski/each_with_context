module Enumerable

  # Calls block with two arguments: the current <tt>element</tt> an EnumerableContext,
  # which provides details about the element's context. See class docs for details.
  def each_with_context &block
    each_with_index do |element, i|
      yield(element, EnumerableContext.new(self,i))
    end
  end

end