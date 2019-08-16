#!/usr/bin/env ruby

#
# SLOTH Movers test harness
#
# Usage: harness.rb <script> <inventory file> <capacity> <time limit>
#
# Example:
#   harness.rb tcollier/my_solution.rb inventory_50.csv 1000 5
#
# If the script produces valid output in the specified time limit, then the output
# of the harness is the total D0Va of all selected items. Otherwise the error
# conditions are:
#
#  Exit status |                           Reason
# -------------+--------------------------------------------------------------
#            1 | The total weight of the selected items exceeds the capacity
#            2 | At least one line of output was not a valid item name
#            3 | An item was chosen multiple times
#            4 | The script did not complete within the specified time limit
#

require 'set'

# Status code of the `timeout` Unix command when the command it terminates the command
TIMEOUT_STATUS = 124

script = ARGV[0]
file_name = ARGV[1]
capacity = ARGV[2].to_i
timeout = ARGV[3].to_i

Item = Struct.new(:name, :dova, :weight)

all_items = {}
File.open(file_name, 'r').each do |line|
  parts = line.chomp.split(',')
  all_items[parts[0]] = Item.new(parts[0], parts[1].to_i, parts[2].to_i)
end

response = %x[timeout #{timeout} #{script} #{file_name} #{capacity} #{timeout}]

if $?.exitstatus == TIMEOUT_STATUS
  $stderr.puts "Timeout! Script ran for longer than #{timeout} second(s)"
  exit(4)
end

selected_items = response.split("\n")

invalid_item = selected_items.detect { |item| !all_items.key?(item) }
if invalid_item
  $stderr.puts "Invalid item: #{invalid_item}"
  $stderr.puts "Raw response:"
  $stderr.puts response
  exit(2)
end

unique_items = Set.new
selected_items.each do |item|
  if unique_items.include?(item)
    $stderr.puts "Duplicate item: #{item}"
    $stderr.puts "Raw response:"
    $stderr.puts response
    exit(3)
  else
    unique_items << item
  end
end

total_weight = selected_items.map { |item| all_items[item] }.map(&:weight).sum
if total_weight > capacity
  $stderr.puts "Total weight (#{total_weight}) exceeds capacity (#{capacity})"
  $stderr.puts "Raw response:"
  $stderr.puts response
  exit(1)
end

puts selected_items.map { |item| all_items[item] }.map(&:dova).sum
