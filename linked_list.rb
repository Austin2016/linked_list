class LinkedList 
  
  
  def initialize
    @head = nil
  end 

  def append(value)
    if @head == nil 
      @head = Node.new(value)
    else 
      self.tail.next_item = Node.new(value) 
    end 
  end

  def prepend(value)
  	@head = Node.new(value,@head)
  end  

  def tail 
    if @head == nil 
      return nil 
    end
    current = @head
    while current.next_item != nil   
      current = current.next_item
    end  
    current 
  end
  
  def size 
    count = 0
    current = @head  
    while current!=nil 
      count +=1
      current = current.next_item
    end
    count
  end 

  def at(index)
      if index < 0
        return nil 
      end 
      current = @head
      count = 0
      while count < index && current != nil  
        count += 1
        current = current.next_item  
      end  
    current  
  end 

  def pop
    if @head == nil 
       return nil
    end  
    current = @head
    previous = nil 
    while current.next_item != nil 
      previous = current
      current = current.next_item 
    end 
    if previous != nil 
      previous.next_item = nil
    else 
      @head = nil 
    end   
    current.value  
  end 

  def contains?(value) 
    current = @head
    while current != nil 
      if value == current.value 
        return true 
      else 
        current = current.next_item 
      end 
    end 
    return false    
  end
  
  def find(value)
    current = @head
    index = 0
    while current != nil
      if value == current.value 
        return index
      else
        current = current.next_item
        index += 1
      end
    end 
    return nil  
  end

  def to_s
    current = @head 
    while current != nil
      print "( #{current.value} ) ---> "
      current = current.next_item
    end
    print " nil \n"  
  end 
  

  def insert_at (value,index) #index must be between zero and size
    if index < 0 || index > self.size 
      print "index out of range" 
    end 
    previous_node = self.at(index - 1)
    if previous_node != nil 
      previous_node.next_item = Node.new(value, previous_node.next_item)
    else
      @head = Node.new(value,@head)
    end  
  end   
end          


class Node 

  def initialize(value,next_item=nil) 
    @value = value 
    @next_item = next_item 
  end 

  def value=(value)
    @value = value  
  end 
  
  def value
    @value  
  end 

  def next_item=(next_item)
    @next_item = next_item 
  end  

  def next_item
    @next_item
  end 
end 

#main 
my_list = LinkedList.new 
my_list.append(1)
my_list.append(7)
my_list.append(3)
my_list.prepend(0)
puts my_list.tail.value #should be 3 
puts my_list.size       #should be 4 
puts my_list.contains?(3) #should be true
puts my_list.contains?(5) #should be false
puts "value #{my_list.at(2).value} is at index #{my_list.find(7)}"   
my_list.to_s 
my_list.insert_at(100,1) 
my_list.to_s         #should put 0,100,1,7,3,
