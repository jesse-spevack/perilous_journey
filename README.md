# Perilous Journey
### Ruby Linked List Demo

This is a demonstration of how one can use the expressiveness of Ruby to write a recursive linked list.
The code in this repo is part of a [blog post]() describing the development steps in this projcet.

This project draws heavily from the Turing School's [Perilous Journey](http://backend.turing.io/module1/projects/perilous_journey) project.

# Usage
1. git clone
2. cd perilous_journey
3. Run the test suite -
  a. ruby test/node_test.rb
  b. ruby test/linked_list_test.rb

To build a linked list open 'irb' and:
```bash
irb
2.3.1 :001 > require './lib/linked_list'
 => true
2.3.1 :002 > list = LinkedList.new
 => #<LinkedList:0x007f822880d0e8 @head=nil>
2.3.1 :003 > list.append('Williams')
 => #<Node:0x007f8228804920 @surname="Williams", @next_node=nil>
2.3.1 :004 > list.append('Laws')
 => #<Node:0x007f8228834760 @surname="Laws", @next_node=nil>
2.3.1 :005 > list.append('Johnson')
 => #<Node:0x007f8228147470 @surname="Johnson", @next_node=nil>
2.3.1 :006 > list.to_string
 => "The Williams family, followed by the Laws family, followed by the Johnson family"
2.3.1 :007 > list.find(1,2)
 => "The Laws family, followed by the Johnson family"
2.3.1 :010 > list.includes?('Laws')
 => true
 2.3.1 :011 > list.insert(2, 'Roberts')
 => #<Node:0x007f822982cf50 @surname="Roberts", @next_node=#<Node:0x007f8228147470 @surname="Johnson", @next_node=nil>>
 2.3.1 :013 > list.to_string
 => "The Williams family, followed by the Laws family, followed by the Roberts family, followed by the Johnson family"
 2.3.1 :014 > list.pop
The Johnson family has died of dysentery
 => #<Node:0x007f8228147470 @surname="Johnson", @next_node=nil>
2.3.1 :015 > list.to_string
 => "The Williams family, followed by the Laws family, followed by the Roberts family"
 2.3.1 :016 > list.count
 => 3
2.3.1 :017 > list.append('Vader')
 => #<Node:0x007f8229814a90 @surname="Vader", @next_node=nil>
2.3.1 :018 > list.count
 => 4
 ```
