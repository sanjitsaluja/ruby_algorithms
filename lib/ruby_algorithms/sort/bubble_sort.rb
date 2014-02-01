module RubyAlgorithms
  module Sort

    # bubble_sort:
    #
    # Implementation of bubble sort - https://en.wikipedia.org/wiki/Bubble_sort
    # Time Complexity:  O(N^2)
    # Space Complexity: O(1)
    # Stable: Yes
    #
    # Repeated swaps adjacent elements.
    #
    # ==== Attributes
    #
    # * +array+ - array to sort
    #
    # ==== Examples
    #
    # bubble_sort([3,1,2]) => [1,2,3]
    #
    def bubble_sort(array = [])
      for i in (0...array.length-1)
        made_swaps = false
        for j in (1...array.length)
          if array[i] > array[j]
            made_swaps = true
            tmp = array[i]
            array[i] = array[j]
            array[j] = tmp
          end
        end
        break unless made_swaps
      end
      array
    end
  end
end
