# frozen_string_literal: true

previous = nil
count_increasing = 0
count_total = 0

File.foreach('day01-input.txt') do |reading|
  count_increasing += 1 if !previous.nil? && (reading.to_i > previous)
  previous = reading.to_i
  count_total += 1
end

puts "Reading increased from previous: #{count_increasing}"
puts "Total number of lines: #{count_total}"
