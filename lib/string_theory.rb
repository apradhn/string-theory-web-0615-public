require "pry"

def sort_by_appearance(characters_to_sort, long_text)
  long_text = long_text.downcase.split("")
  characters = characters_to_sort.downcase.split("")
  char_count = characters.each_with_object({}) do |char, hash|
    hash[char] = 0
  end
  long_text.each do |char|
    if characters.include?(char)
      char_count[char] += 1
    end
  end
  sublists = char_count.collect {|char, count| [char, count]}
  queue = merge_sort(sublists)
  head = queue.first
  head.collect{|arr| arr.first}.join("")  
end

def merge_sort(sublists)
  queue = []
  size = sublists.size
  queue[0] = [sublists[0]]
  queue[1] = sublists[1, size]
  i = 0
  while i < sublists.size && queue.last.size > 0
    head = queue.first
    tail = queue.last
    if head.first.last < tail.first.last
      head.unshift(tail.shift)
    else
      if head.size == 1 && tail.first.last < head.first.last
        head << tail.shift
      elsif head.size > 1 && head.first.last > tail.first.last
        j = 1
        loop do
          if head[j].last < tail.first.last
            break
          end
          j += 1
          break if j == head.size
        end
        head.insert(j, tail.shift)
      end  
    end
    i += 1
  end
  queue
end