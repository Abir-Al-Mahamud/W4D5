def first_anagram?(str1, str2)
    beginning_time = Time.now
    all_anagrams = str1.split("").permutation.to_a #because of permutation time complexity = O(n!)
    all_anagrams.map! { |sub_arr| sub_arr.join("") }
    all_anagrams.include?(str2)
    "Time complexity of first_anagram: #{(Time.now - beginning_time)}"
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1.each_char do |char1|
        str2.each_char do |char2|
            if char1 == char2 
                char2_index = str2.index(char2)
                str2.delete(str2[char2_index])
            end
        end
    end
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true