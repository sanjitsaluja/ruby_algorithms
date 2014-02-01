module RubyAlgorithms
  module Search


    # binary_search:
    #
    # Implementation of binary search - https://en.wikipedia.org/wiki/Binary_search_algorithm
    # Time Complexity:  O(lg n)
    # Partitions the array until the `key` is found.
    #
    # ==== Attributes
    #
    # * +array+ - array to find in sorted in increasing order
    # * +key+ - key to find in array
    #
    # ==== Examples
    #
    # binary_search([1,2,3], 1) => 0
    # binary_search([1,2,3], 4) => nil
    #
    def binary_search(array = [], key)
      if key && array
        lo = 0
        hi = array.length - 1
        while lo <= hi
          mid = (hi + lo) / 2
          if array[mid] == key
            # We've found our key. Return index.
            return mid
          elsif array[mid] < key
            # Key is bigger than middle element search to the right
            lo = mid + 1
          else
            # Key is smaller than middle element search to the left
            hi = mid - 1
          end
        end
      end

      return nil
    end
  end
end
