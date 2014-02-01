module RubyAlgorithms
  module Sort

    # selection_sort:
    #
    # Implementation of selection sort - https://en.wikipedia.org/wiki/Selection_sort
    # Time Complexity:  O(N^2)
    # Space Complexity: O(1)
    # Stable: Yes
    # Sorts in increasing order. Maintains a sorted sub-array up till an index. Selects
    # the smallest element from index+1 to end of array repeatedly
    #
    # ==== Attributes
    #
    # * +array+ - array to sort
    #
    # ==== Examples
    #
    # selection_sort([3,1,2]) => [1,2,3]
    #
    def selection_sort(array = [])
      for i in (0...array.length)
        min = i
        for j in (i+1...array.length)
          if array[j] < array[min]
            min = j
          end
        end
        if i != min
          tmp = array[i]
          array[i] = array[min]
          array[min] = tmp
        end
      end
      array
    end
  end
end
