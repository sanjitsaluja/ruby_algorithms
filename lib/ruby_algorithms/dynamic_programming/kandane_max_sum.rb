module RubyAlgorithms
  module DynamicProgramming

    # KandaneMaxSum
    #
    # Maximum subaray - https://en.wikipedia.org/wiki/Maximum_subarray_problem
    # Time Complexity:  O(N)
    #
    class KandaneMaxSum
      attr_accessor :elements

      def initialize(elements)
        @elements = elements
      end

      def max_subarray
        start = 0
        stop = 0
        max_sum = elements[0]
        previous_sum = elements[0]
        1.upto(elements.length - 1) do |i|
          new_sum = elements[i] + previous_sum
          if new_sum > max_sum
            max_sum = new_sum
            stop = i
          end

          if new_sum > 0
            previous_sum = new_sum
          else
            previous_sum = elements[i]
            start = i
            stop = i
          end
        end

        [max_sum, start, stop]
      end

    end
  end
end
