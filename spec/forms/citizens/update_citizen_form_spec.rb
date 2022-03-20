# frozen_string_literal: true

RSpec.describe Citizens::UpdateCitizenForm do
  it { is_expected.to validate_numericality_of(:id).is_greater_than(0) }
  it { is_expected.to validate_inclusion_of(:state).in_array(::Citizen::STATES) }
end
