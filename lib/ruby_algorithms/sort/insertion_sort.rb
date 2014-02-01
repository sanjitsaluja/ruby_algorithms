module RubyAlgorithms
  module Sort

    # insertion_sort:
    #
    # Implementation of insertion sort - https://en.wikipedia.org/wiki/Insertion_sort
    # Time Complexity:  O(N^2)
    # Space Complexity: O(1)
    # Stable: Yes
    # Sorts in increasing order. Maintains a sorted sub-array up till an index. Insert
    # the next element in its correct position in to the sorted sub-array.
    #
    # ==== Attributes
    #
    # * +array+ - array to sort
    #
    # ==== Examples
    #
    # insertion_sort([3,1,2]) => [1,2,3]
    #
    def insertion_sort(array = [])
      for i in (1...array.length)
        val = array[i]
        j = i
        while j > 0 && array[j-1] > val
          array[j] = array[j-1]
          j = j - 1
        end
        array[j] = val
      end
      array
    end
  end
end
