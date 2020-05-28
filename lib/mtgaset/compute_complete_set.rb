require 'bigdecimal'

module MTGASet
  class ComputeCompleteSet
    attr_reader :number_of_rares_in_expansion,
                :number_of_rares_you_own,
                :number_of_packs_you_own,
                :average_number_of_rares_draft,
                :average_number_of_packs_draft

    def initialize(number_of_rares_in_expansion:, number_of_rares_you_own:, number_of_packs_you_own:, average_number_of_rares_draft:, average_number_of_packs_draft:)
      @number_of_rares_in_expansion = number_of_rares_in_expansion
      @number_of_rares_you_own = number_of_rares_you_own
      @number_of_packs_you_own = number_of_packs_you_own
      @average_number_of_rares_draft = average_number_of_rares_draft
      @average_number_of_packs_draft = average_number_of_packs_draft
    end

    def call
      number_of_rares_missing / number_of_rares_we_get_draft
    end

    def number_of_rares_missing
      4 * number_of_rares_in_expansion - number_of_rares_you_own - number_of_rares_in_packs(number_of_packs_you_own)
    end

    def number_of_rares_we_get_draft
      average_number_of_rares_draft + number_of_rares_in_packs(average_number_of_packs_draft)
    end

    def number_of_rares_in_packs(number_of_packs)
      (number_of_packs * rare_pack_rate * wild_cards_rate).to_i
    end

    def rare_pack_rate
      BigDecimal('7') / BigDecimal('8')
    end

    def wild_cards_rate
      BigDecimal('11') / BigDecimal('12')
    end
  end
end
