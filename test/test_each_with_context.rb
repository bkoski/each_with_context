require File.dirname(__FILE__) + '/test_helper'

class TestEachWithContext < Test::Unit::TestCase

  context "first?" do
    setup do
      @collection = [1,2,3,4]
    end

    should "return true on last element" do
      @collection.each_with_context do |num,c|
         assert c.first? if num == 1
      end
    end
    
    should "return false for all other elements" do
      @collection.each_with_context do |num,c|
         assert !c.first?, "first? should be false for #{num}" if num != 1
      end
    end
  end

  context "last?" do
    setup do
      @collection = [1,2,3,4]
    end

    should "return true on last element" do
      @collection.each_with_context do |num,c|
         assert c.last? if num == 4
      end
    end
    
    should "return false for all other elements" do
      @collection.each_with_context do |num,c|
         assert !c.last?, "last? should be false for #{num}" if num != 4
      end
    end
  end

  context "edge" do
    setup do
      @collection = [1,2,3]
    end

    should "return :first for first element" do
      @collection.each_with_context do |num,c|
        assert_equal :first, c.edge if c == 1
      end
    end
    
    should "return :last for last element" do
      @collection.each_with_context do |num,c|
        assert_equal :last, c.edge if c == 3
      end 
    end
    
    should "return nil for an element in the middle" do
      @collection.each_with_context do |num,c|
        assert_nil c.edge if c == 2
      end
    end
  end
  
  context "index" do
    should "return the zero-based index as index" do
      [0,1,2,3].each_with_context do |num,c|
        assert_equal num, c.index
      end
    end
  end
  
  context "next" do
    setup do
      @collection = ['a','b','c','d']
    end

    should "return the next element" do
      @collection.each_with_context do |element, c|
        assert_equal(@collection[c.index + 1], c.next) unless c.last?
      end
    end
    
    should "return nil if there is no next element" do
      @collection.each_with_context do |element, c|
        assert_nil c.next if c.last?
      end
    end
  end
  
  context "previous" do
    setup do
      @collection = ['a','b','c','d']
    end

    should "return the previous element" do
      @collection.each_with_context do |element, c|
        assert_equal(@collection[c.index - 1], c.previous) unless c.first?
      end
    end
    
    should "return nil if there is no previous element" do
      @collection.each_with_context do |element, c|
        assert_nil c.previous if c.first?
      end
    end
  end
  
  context "next_differs_on?" do
    setup do
      @collection = [Date.today, Date.today + 1, Date.today + 2]
    end

    should "return true if next element doesn't have same value for specified method" do
      [Date.today, Date.today + 1, Date.today + 2].each_with_context do |date,c|
        assert c.next_differs_on?(:day) unless c.last?
      end
    end
    
    should "return false if next element doesn't have same value for specified method" do
      [Date.today, Date.today, Date.today].each_with_context do |date,c|
        assert !c.next_differs_on?(:day) unless c.last?
      end
    end
    
    should "return nil if there is no next element" do
      [Date.today, Date.today, Date.today].each_with_context do |date,c|
        assert_nil c.next_differs_on?(:day) if c.last?
      end
    end
  end
  
  context "previous_differs_on?" do
    setup do
      @collection = [Date.today, Date.today + 1, Date.today + 2]
    end

    should "return true if next element doesn't have same value for specified method" do
      [Date.today, Date.today + 1, Date.today + 2].each_with_context do |date,c|
        assert c.previous_differs_on?(:day) unless c.first?
      end
    end
    
    should "return false if next element doesn't have same value for specified method" do
      [Date.today, Date.today, Date.today].each_with_context do |date,c|
        assert !c.previous_differs_on?(:day) unless c.first?
      end
    end
    
    should "return nil if there is no next element" do
      [Date.today, Date.today, Date.today].each_with_context do |date,c|
        assert_nil c.previous_differs_on?(:day) if c.first?
      end
    end
  end
  
end