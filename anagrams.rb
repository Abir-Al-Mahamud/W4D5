

def first_anagram?(str1, str2)
    # beginning_time = Time.now
    all_anagrams = str1.split("").permutation.to_a #because of permutation time complexity = O(n!)
    p all_anagrams
    all_anagrams.map! { |sub_arr| sub_arr.join("") } #O(n!)
    all_anagrams.include?(str2)#n(n!)
    # "Time complexity of first_anagram: #{(Time.now - beginning_time)}"
end
#O(n!)
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    beginning_time = Time.now
    str1.each_char do |char1|#O(n)
        str2.each_char do |char2|#O(n)
            if char1 == char2 #O(1)
                char2_index = str2.index(char2) #O(n)
                str2[char2_index] = ""#O(1)
            end
        end
    end
    "Time complexity of first_anagram: #{(Time.now - beginning_time)}"
    str2.empty?
end
#O(n^3)
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    beginning_time = Time.now
    str1.split("").sort == str2.split("").sort #O(nlogn)
    "Time complexity of first_anagram: #{(Time.now - beginning_time)}"
end
#O(nlogn)
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)#O(1)
    beginning_time = Time.now
    str1.each_char {|char| hash1[char]+=1}#O(n)
    str2.each_char {|char| hash1[char]-=1}#O(n)
    hash1.all? {|_, v| v.zero?}#O(n)
    "Time complexity of first_anagram: #{(Time.now - beginning_time)}"
end
#O(n)
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true