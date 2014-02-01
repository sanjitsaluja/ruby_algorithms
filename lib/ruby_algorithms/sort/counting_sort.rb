module RubyAlgorithms
  module Sort

    # counting_sort:
    #
    # Implementation of counting sort - https://en.wikipedia.org/wiki/Counting_sort
    # N = number of elements. K = range of elements
    # Time Complexity:  O(N + K)
    # Space Complexity: O(K)
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
    # counting_sort([3,1,2], 1, 3) => [1,2,3]
    #
    def counting_sort(array = [], min, max)
      range = max - min + 1
      # indices the index of the final element
      indices = Array.new(range, 0)

      # Count the number of items
      array.each do |i|
        indices[i - min] += 1
      end

      if array.length > 1
        # Calculate position in output array
        1.upto(indices.length-1) do |index|
          indices[index] = indices[index] + indices[index-1]
        end
      end

      # Placement in new array
      out = Array.new(array.length)
      array.reverse_each do |i|
        index = indices[i-min]
        indices[i-min] -= 1
        out[index-1] = i
      end

      out
    end
  end
end
