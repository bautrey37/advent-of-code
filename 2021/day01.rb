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

window = []
max = 3
iteration = 0
count_increasing2 = 0

File.foreach('day01-input.txt') do |reading|
  # initialize window
  window.push(reading.to_i) if iteration < max
  iteration += 1

  unless iteration < max
    previous = window.sum
    current = previous - window[0] + reading.to_i
    count_increasing2 += 1 if current > previous

    window.shift
    window.push(reading.to_i)
  end
  # puts window.inspect
end

puts "v2 Reading increased from previous: #{count_increasing2}"
