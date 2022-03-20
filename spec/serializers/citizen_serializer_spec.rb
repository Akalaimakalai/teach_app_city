# frozen_string_literal: true

RSpec.describe CitizenSerializer do
  let(:citizen) { create(:citizen) }

  def citizen_hash
    ActiveModelSerializers::SerializableResource.new(citizen, serializer: described_class).serializable_hash
  end

  it 'содержит только допустимые параметры' do
    expect(citizen_hash).to eq(
      id: citizen.id,
      name: citizen.name,
      age: citizen.age,
      gender: citizen.gender,
      state: citizen.state
    )
  end
end
