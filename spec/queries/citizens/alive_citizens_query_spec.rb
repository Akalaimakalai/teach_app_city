# frozen_string_literal: true

RSpec.describe Citizens::AliveCitizensQuery do
  let!(:citizen_1) { create(:citizen) }
  let!(:citizen_2) { create(:citizen) }
  let!(:citizen_3) { create(:citizen, :dead) }

  it 'возвращает корректный результат' do
    expect(subject.call).to contain_exactly(citizen_1, citizen_2)
  end
end
