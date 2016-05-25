module RubyAlgorithms
  module BitAlgorithms

    # occurs_only_once:
    #
    # Find in element that occurs only once in O(N) time
    #
    def occurs_only_once(a = [])
      a.reduce(:^)
    end



  end
end
