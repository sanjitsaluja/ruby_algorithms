module RubyAlgorithms
  module DynamicProgramming

    # LongestCommonSubsequence
    #
    # Maximum subaray - https://en.wikipedia.org/wiki/Longest_common_subsequence_problem
    # Time Complexity:  O(NM)
    # Space Complexity: O(NM * MAX(N, M)) (Not the best because is storing strings)
    #
    class LongestCommonSubsequence
      attr_accessor :x
      attr_accessor :y

      def initialize(x, y)
        @x = x
        @y = y
      end

      def lcs
        dp = Array.new(x.length + 1) { Array.new(y.length + 1, "") }
        1.upto(x.length) do |i|
          1.upto(y.length) do |j|
            dp[i][j] = if x[i-1] == y[j-1]
                         dp[i-1][j-1] + x[i-1]
                       else
                         [dp[i-1][j], dp[i][j-1]].max
                       end
          end
        end
        dp[x.length][y.length]
      end

    end
  end
end
