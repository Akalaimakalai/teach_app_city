# frozen_string_literal: true

RSpec.describe Citizens::DestroyCitizenForm do
  it { is_expected.to validate_numericality_of(:id).is_greater_than(0) }
end
