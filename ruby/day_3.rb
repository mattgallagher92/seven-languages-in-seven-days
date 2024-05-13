class Numeric
  def inches
    self
  end

  def feet
    self * 12.inches
  end

  def yards
    self * 3.feet
  end

  def miles
    self * 1760.yards
  end

  def back
    self * -1
  end

  def forward
    self
  end
end

puts "10 miles back is #{10.miles.back} inches"
puts

class Roman
  def self.method_missing name, *args
    roman = name.to_s
    roman.gsub!('IV', 'IIII')
    roman.gsub!('IX', 'VIIII')
    roman.gsub!('XL', 'XXXX')
    roman.gsub!('XC', 'LXXXX')

    (roman.count('I') +
     roman.count('V') * 5 +
     roman.count('X') * 10 +
     roman.count('L') * 50 +
     roman.count('C') * 100)
  end
end

puts "X is #{Roman.X}"
puts "XCII is #{Roman.XCII}"
puts "XLIV is #{Roman.XLIV}"
puts

class CsvRow

  def initialize(headers, values)
    @headers = headers
    @values = values
  end

  attr_accessor :headers, :values

  def method_missing name, *args
    i = @headers.find_index name.to_s
    values[i]
  end

end

module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    def read
      @csv_rows = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_rows << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    attr_accessor :headers, :csv_rows

    def initialize
      read
    end

    def each(&block)
      @csv_rows.each(&block)
    end

  end  

end
 
class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.h2}
puts
  
