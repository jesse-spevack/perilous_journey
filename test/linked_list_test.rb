# perilous_journy/test/linked_list_test.rb
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/linked_list.rb'

class LinkedListTest < Minitest::Test
  def test_new_returns_a_linked_list
    subject = LinkedList.new
    assert_instance_of LinkedList, subject
  end

  def test_head_returns_nil_when_first_initialized
    subject = LinkedList.new
    assert_nil subject.head
  end

  def test_append_adds_new_node_to_end_of_list
    subject = LinkedList.new

    result = subject.append('West')

    assert_instance_of Node, result
    assert_equal 'West', result.surname
    assert_equal result, subject.head
  end

  def test_count_returns_zero_for_empty_list
    subject = LinkedList.new
    assert_equal 0, subject.count
  end

  def test_count_returns_one_for_list_with_one_node
    subject = LinkedList.new
    subject.append('West')

    assert_equal 1, subject.count
  end

  def test_to_string_returns_correct_sentence_when_one_node_present
    subject = LinkedList.new
    subject.append('West')

    result = subject.to_string

    assert_equal 'The West family', result
  end

  def test_append_two_nodes
    subject = LinkedList.new
    subject.append('Rhodes')
    subject.append('Hardy')

    result = subject.head.next_node.surname

    assert_equal 'Hardy', result
  end

  def test_empty_returns_true_when_head_is_nil
    subject = LinkedList.new
    assert_equal true, subject.empty?
  end

  def test_empty_returns_false_when_head_is_not_nil
    subject = LinkedList.new
    subject.append('Rhodes')

    assert_equal false, subject.empty?
  end

  def test_last_node_returns_the_tail
    subject = LinkedList.new
    subject.append('Rhodes')

    result = subject.last_node(subject.head)

    assert_instance_of Node, result
    assert_equal 'Rhodes', result.surname
  end

  def test_new_node_returns_a_new_node
    subject = LinkedList.new

    result = subject.new_node('Rhodes')

    assert_instance_of Node, result
    assert_equal 'Rhodes', result.surname
  end

  def test_append_three_nodes
    subject = LinkedList.new
    subject.append('Rhodes')
    subject.append('Hardy')
    subject.append('Smith')

    result = subject.head.next_node.next_node.surname

    assert_equal 'Smith', result
  end

  def test_count_three_nodes
    subject = LinkedList.new
    subject.append('Rhodes')
    subject.append('Hardy')
    subject.append('Smith')

    result = subject.count

    assert_equal 3, result
  end

  def test_to_string_works_with_three_nodes
    subject = LinkedList.new
    subject.append('Rhodes')
    subject.append('Hardy')
    subject.append('Smith')
    expected = 'The Rhodes family, followed by the Hardy family, followed by the Smith family'

    result = subject.to_string

    assert_equal expected, result
  end

  def test_prepend_appends_to_head
    expected = 'The McKinney family, followed by the Brooks family, followed by the Henderson family'
    subject = LinkedList.new
    subject.append('Brooks')
    subject.append('Henderson')
    subject.prepend('McKinney')

    result = subject.to_string

    assert_equal expected, result
  end

  def test_insert
    expected = 'The Brooks family, followed by the Lawson family, followed by the Henderson family, followed by the McKinney family'
    subject = LinkedList.new
    subject.append('Brooks')
    subject.append('Henderson')
    subject.append('McKinney')

    result = subject.insert(1, 'Lawson')

    assert_instance_of Node, result
    assert_equal 'Lawson', result.surname
    assert_equal expected, subject.to_string
  end

  def test_find_from_position_one
    expected = 'The Lawson family, followed by the Brooks family, followed by the Henderson family'
    subject = LinkedList.new
    subject.append('McKinney')
    subject.append('Lawson')
    subject.append('Brooks')
    subject.append('Henderson')
    subject.append('Davis')

    result = subject.find(1, 3)

    assert_equal expected, result
  end

  def test_find_from_middle
    expected = 'The Brooks family'
    subject = LinkedList.new
    subject.append('McKinney')
    subject.append('Lawson')
    subject.append('Brooks')
    subject.append('Henderson')
    subject.append('Davis')

    result = subject.find(2, 1)

    assert_equal expected, result
  end

  def test_includes_returns_true_when_given_surname_is_present
    subject = LinkedList.new
    subject.append('McKinney')
    subject.append('Lawson')
    subject.append('Brooks')
    subject.append('Henderson')
    subject.append('Davis')

    result = subject.includes?('Henderson')

    assert_equal true, result
  end

  def test_includes_returns_false_when_given_surname_is_not_present
    subject = LinkedList.new
    subject.append('McKinney')
    subject.append('Lawson')
    subject.append('Brooks')
    subject.append('Henderson')
    subject.append('Davis')

    result = subject.includes?('Williams')

    assert_equal false, result
  end

  def test_pop
    subject = LinkedList.new
    subject.append('McKinney')
    subject.append('Lawson')
    subject.append('Brooks')
    subject.append('Henderson')

    result = subject.pop

    assert_equal 'Henderson', result.surname
  end
end
