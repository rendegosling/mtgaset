require 'spec_helper'

RSpec.describe MTGASet::ComputeCompleteSet do
  it do
    expect(
      MTGASet::ComputeCompleteSet.new(
        number_of_rares_in_expansion: 53,
        number_of_rares_you_own: 44,
        number_of_packs_you_own: 5,
        average_number_of_rares_draft: 8,
        average_number_of_packs_draft: 1
      ).call
    ).to eq 20
  end
end
