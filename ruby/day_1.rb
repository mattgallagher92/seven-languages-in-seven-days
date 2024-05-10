# Run using the command `ruby day_1.rb`

puts 'Hello, world.'

puts ('Hello, Ruby'.index 'Ruby')

i = 0
while i < 10
  i = i + 1
  puts 'Matt'
end

i = 0
while i < 10
  i = i + 1
  puts "This is sentence number #{i}"
end

i = rand(10)
puts 'Guess the number...'
guess = -1

until guess == i
  guess = gets().to_i
  if guess < i
    puts 'Too low, guess again!'
  elsif guess > i
    puts 'Too high, guess again!'
  end
end

puts "Yes, the number is #{i}!"
