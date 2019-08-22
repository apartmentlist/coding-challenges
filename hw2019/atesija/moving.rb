require 'csv'

input_csv = ARGV[0]
capacity = ARGV[1].to_i
execution_time = ARGV[2].to_i
iterations = Time.now.sec * execution_time
input = CSV.read(input_csv)
for i in 0..iterations
    break if i >= input.length
    length = input[i][2].to_i
    if length < capacity
        puts input[i][0]
        capacity -= length
    end
end
