module RubyAlgorithms
  module Sort

    # heap_sort:
    #
    # Implementation of head sort - https://en.wikipedia.org/wiki/Heap_sort
    # Time Complexity:  O(N^LgN)
    # Space Complexity: O(1)
    # Stable: NO
    #
    # Creates a min-heap and extracts root.
    #
    # ==== Attributes
    #
    # * +array+ - array to sort
    #
    # ==== Examples
    #
    # heap_sort([3,1,2]) => [1,2,3]
    #
    def heap_sort(array = [])
      heap = Heap.new(array)
      sorted = []
      while heap.size > 0
        sorted.push heap.extract_min
      end
      sorted
    end

    class Heap
      def initialize(array = [])
        @array = array || []
        (@array.length/2).downto(0) do |x|
          heapify(x)
        end
      end

      def insert(item)
        array << item
        i = array.length - 1
        while i > 0 && array[parent(i)] > array[i]
          array[parent(i)], array[i] = array[i], array[parent(i)]
          i = parent(i)
        end
        test_heap_invariant
      end

      def parent(i)
        (i - 1)/2
      end

      def test_heap_invariant
        test_heap(0)
      end

      def test_heap(x)
        if x >= array.length
          return
        end
        l = 2 * x + 1
        r = 2 * x + 2
        raise if l < array.length - 1 && array[x] > array[l]
        raise if r < array.length - 1 && array[x] > array[r]
        test_heap(l)
        test_heap(r)
      end

      def extract_min
        if array.length > 0
          min = array[0]
          last = array.pop
          if (array.length > 0)
            array[0] = last
            heapify(0)
          end
          min
        end
        test_heap_invariant
      end

      def size
        array.length
      end

      private

      def heapify(i)
        if i < array.length / 2
          min = i
          left = 2 * i + 1
          if left < array.length && array[left] < array[min]
            min = left
          end

          right = 2 * i + 2
          if right < array.length && array[right] < array[min]
            min = right
          end

          if min != i
            tmp = array[min]
            array[min] = array[i]
            array[i] = tmp
            heapify(min)
          end
        end
      end

      attr_accessor :array
    end
  end
end
