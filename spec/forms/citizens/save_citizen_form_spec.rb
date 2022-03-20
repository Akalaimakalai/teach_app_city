# frozen_string_literal: true

RSpec.describe Citizens::SaveCitizenForm do
  describe '#name' do
    # allowed format
    it { is_expected.to allow_value('Valid Name').for(:name) }
    it { is_expected.to allow_value('ValidName').for(:name) }
    # invalid format
    it { is_expected.to_not allow_value('Invalid_Name').for(:name) }
    it { is_expected.to_not allow_value('1nvalid Name').for(:name) }
    it { is_expected.to_not allow_value('!&*?#').for(:name) }
    # length
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(200) }
  end

  it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_inclusion_of(:gender).in_array(::Citizen::GENDERS) }
end
