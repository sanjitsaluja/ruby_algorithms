module RubyAlgorithms
  module Sort

    # cocktail_sort:
    #
    # Implementation of bubble sort - https://en.wikipedia.org/wiki/Cocktail_shaker_sort
    # Time Complexity:  O(N^2)
    # Space Complexity: O(1)
    # Stable: Yes
    #
    # Minor constant factor improvement over bubble sort. Helps with turtles (Rabbits & Turtles)
    #
    # ==== Attributes
    #
    # * +array+ - array to sort
    #
    # ==== Examples
    #
    # cocktail_sort([3,1,2]) => [1,2,3]
    #
    def cocktail_sort(array = [])
      found_inversions = true
      while found_inversions
        found_inversions = false
        # Move biggest element to the end of the list
        1.upto(array.length - 1) do |i|
          if array[i-1] > array[i]
            array[i-1], array[i] = array[i], array[i-1]
            found_inversions = true
          end
        end
        # Move smallest element to the begining of the list
        (array.length - 1).downto(1) do |i|
          if array[i-1] > array[i]
            array[i-1], array[i] = array[i], array[i-1]
            found_inversions = true
          end
        end
      end
    end
  end
end
