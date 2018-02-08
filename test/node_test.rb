# perilous_journy/test/node_test.rb
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test
  def test_new_returns_a_node
    subject = Node.new('Burke')
    assert_instance_of Node, subject
  end

  def test_surname_returns_name
    subject = Node.new('Burke')
    assert_equal 'Burke', subject.surname
  end

  def test_next_node_returns_nil
    subject = Node.new('Burke')
    assert_nil subject.next_node
  end

  def test_tail_returns_true_if_next_node_is_nil
    subject = Node.new('Burke')
    assert_equal subject.tail?, true
  end

  def test_next_node_can_change_node_state
    subject = Node.new('Burke')
    data = 'pants'

    subject.next_node = data
    result = subject.next_node

    assert_equal data, result
  end

  def test_it_can_remove_next_node
    subject = Node.new('Burke')
    data = 'pants'

    subject.next_node = data
    subject.clear!

    assert_equal true, subject.tail?
  end
end
