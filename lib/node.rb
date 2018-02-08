# perilous_journy/lib/node.rb
class Node
  attr_reader :surname
  attr_accessor :next_node

  def initialize(surname)
    @surname = surname
    @next_node = nil
  end

  def tail?
    next_node.nil?
  end

  def clear!
    self.next_node = nil
  end
end
