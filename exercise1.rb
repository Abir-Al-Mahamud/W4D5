require "byebug"
def my_min(arr)
    smallest = 0 #O(1)
    before_assessment_time = Time.now #O(1)

    arr.each_with_index do |ele, idx1| #O(n)
        (idx1 + 1...arr.length).each do |idx2| #O(n)
            if arr[idx1] < smallest #O(1)
                smallest = arr[idx1] #O(1)
            end
        end
    end
    puts "Time complexity for nested loop: #{(Time.now - before_assessment_time)} " #O(1)
    puts smallest #O(1)
end
#O(n^2)

def my_better_min(arr)
    smallest = 0
    before_assessment_time = Time.now #O(1)
    arr.each { |ele| smallest = ele if ele < smallest } 

    puts "Time complexity for each loop: #{(Time.now - before_assessment_time)} " #O(1)
    puts smallest #O(1)
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# my_better_min(list)


def largest_contiguous_subsum(arr)
    subs = []
    before_assessment_time = Time.now #O(1)
    
    (0...arr.length).each do |start_index|
        (start_index...arr.length).each do |end_index|
            subs << arr[start_index..end_index]
        end
    end

    max_sum = subs.map(&:sum).max

    puts "Time complexity for loop: #{(Time.now - before_assessment_time)} " #O(1)
    puts max_sum
end

def largest_contiguous_subsum_better(arr)
    curr_sum = 0
    largest_sum = 0
    i = 0
    idx2 = 0
    before_assessment_time = Time.now #O(1)
    
    while i < arr.length
        curr_sum = arr[i..idx2].sum
        if curr_sum > largest_sum
            largest_sum = curr_sum
        end

        if idx2 > arr.length-1   
            i+=1 
            idx2 = i
        end
        idx2 += 1
    end
    puts "Time complexity for while loop: #{(Time.now - before_assessment_time)} " #O(1)
    puts largest_sum
end
list = [2, 3, -6, 7, -6, 7]
largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
largest_contiguous_subsum_better(list) # => 8 (from [7, -6, 7])