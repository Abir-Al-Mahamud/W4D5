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

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min(list)  # =>  -5

my_better_min(list)