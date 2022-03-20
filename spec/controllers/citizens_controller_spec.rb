# frozen_string_literal: true

RSpec.describe CitizensController do
  describe 'GET #index' do
    let!(:citizen_1) { create(:citizen) }
    let!(:citizen_2) { create(:citizen) }
    let!(:citizen_3) { create(:citizen, :dead) }

    before { get :index }

    it 'returns citizen json collection' do
      expect(response.parsed_body).to eq(
        [
          {
            'id' => citizen_1.id,
            'name' => citizen_1.name,
            'age' => citizen_1.age,
            'gender' => citizen_1.gender,
            'state' => citizen_1.state
          },
          {
            'id' => citizen_2.id,
            'name' => citizen_2.name,
            'age' => citizen_2.age,
            'gender' => citizen_2.gender,
            'state' => citizen_2.state
          }
        ]
      )
    end
  end
end
