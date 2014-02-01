module RubyAlgorithms
  module Sort

    # insertion_sort:
    #
    # Implementation of merge sort - https://en.wikipedia.org/wiki/Merge_sort
    # Time Complexity:  O(N LgN)
    # Space Complexity: O(N)
    # Stable: Yes
    # Sorts in increasing order. Divide and conquer sort. Recurisvely divides array into 2,
    # sorts the two halves, then merges.
    #
    # ==== Attributes
    #
    # * +array+ - array to sort
    #
    # ==== Examples
    #
    # merge_sort([3,1,2]) => [1,2,3]
    #
    def merge_sort(array = [])
      if array.length > 1
        mid = array.length / 2
        array1 = merge_sort(array[0...mid])
        array2 = merge_sort(array[mid...array.length])
        return merge(array1, array2)
      end
      array
    end

    def merge(array1, array2)
      merged = Array.new
      i = 0
      j = 0
      while i < array1.length && j < array2.length
        if array1[i] < array2[j]
          merged.push(array1[i])
          i = i+1
        else
          merged.push(array2[j])
          j = j+1
        end
      end

      while i < array1.length
        merged.push(array1[i])
        i += 1
      end

      while j < array2.length
        merged.push(array2[j])
        j += 1
      end
      merged
    end

  end
end
