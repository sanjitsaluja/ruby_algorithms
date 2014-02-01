module RubyAlgorithms
  module Sort

    # quick_sort:
    #
    # Implementation of quick sort - https://en.wikipedia.org/wiki/QuickSort
    # Average Complexity:  O(N LgN)
    # Worst Case: O(N^2)
    # Space Complexity: O(1)
    # Space Complexity: O(1)
    # Stable: No
    # Sorts in increasing order. Divide and conquer sort. Recurisvely partitions array into 2,
    # sorts the two halves
    #
    # ==== Attributes
    #
    # * +array+ - array to sort
    #
    # ==== Examples
    #
    # quick_sort([3,1,2]) => [1,2,3]
    #
    def quick_sort(array = [])
      quick_sort_helper(array, 0, array.length - 1)
      array
    end

    def quick_sort_helper(array, lo, hi)
      if lo < hi && array.length > 1
        pivot_index = partition(array, lo, hi)
        quick_sort_helper(array, lo, pivot_index-1)
        quick_sort_helper(array, pivot_index+1, hi)
      end
    end

    def partition(array, lo, hi)
      pivot = array[hi]
      i = lo
      j = hi
      while i < j
        while array[i] <= pivot && i < j do
          i+=1
        end
        while array[j] > pivot do
          j-=1
        end
        if (i < j)
          tmp = array[j]
          array[j] = array[i]
          array[i] = tmp
        end
      end
      i
    end
  end
end
