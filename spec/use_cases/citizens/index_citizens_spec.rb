# frozen_string_literal: true

RSpec.describe Citizens::IndexCitizens do
  subject do
    described_class.new(
      alive_citizens_query: alive_citizens_query
    )
  end

  let(:alive_citizens_query) { instance_double(::Citizens::AliveCitizensQuery, call: Citizen.all) }

  let(:citizens) { create_list(:citizen, 3) }

  it { expect(subject.call).to eq(citizens) }
end
