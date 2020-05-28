module MTGASet
  class Expansion
    attr_accessor :name, 
                  :short_name,
                  :mythics_count,
                  :rares_count,
                  :uncommons_count,
                  :commons_count

    def initialize(rares_count: 0)
      @rares_count = rares_count
    end
  end
end
