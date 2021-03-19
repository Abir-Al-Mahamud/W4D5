def bad_two_sum?(arr, target_sum)
    before_assessment_time = Time.now
    arr.each_with_index do |el1, idx1|#O(n)
        (idx1+1...arr.length).each do |idx2|#O(n)
            return true if arr[idx1] + arr[idx2] == target_sum #O(1)
        end
    end
    false
    puts "Time complexity: #{Time.now - before_assessment_time}"
end
# O(n^2)
# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
    sums = []
    arr.each_with_index do |ele, idx|
        next if idx+1 == arr.length
        sums << [ele + arr[idx+1]] if idx+1 > idx    
    end

    sorted = sums.flatten.sort

    return sorted if arr.length < 2

    mid = sorted.length /2
    left = okay_two_sum?(sorted.take(mid), target_sum)
    right = okay_two_sum?(sorted.drop(mid), target_sum)

    case sorted[mid] <=> target_sum
    when 0
        return mid
    when 1
        okay_two_sum?(left, target_sum)
    else
        search_res = okay_two_sum?(right, target_sum)
        search_res.nil? ? nil : mid + 1 + search_res 
    end

end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) #should be true