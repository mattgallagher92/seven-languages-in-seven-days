# Ruby day 2

## Ex 1
arr = (1..16).to_a

def pr(i)
  if i % 4 == 0
    puts "#{i},"
  else
    print "#{i}, "
  end
end

arr.each {|i| pr(i)}
puts

arr.each_slice(4) {|s| p s}
puts

## Ex 2

class Tree
  attr :children, :node_name

  def initialize(hash, depth=0)
    throw('tree has more than one root!') if hash.keys.length > 1
    @node_name = hash.keys.first
    @children = hash[hash.keys.first].map {|k, v| Tree.new({k => v}, depth + 1)}
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new({ 'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => { 'child 3' => {}, 'child 4' => {} } } })

puts "Visiting a node"
tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
tree.visit_all {|node| puts node.node_name}
puts

## Ex 3

def print_lines_containing(file, text)
  File.foreach(file) {|l| puts l if l.include? text}
end

print_lines_containing('./ruby/day_1.rb', 'puts')
