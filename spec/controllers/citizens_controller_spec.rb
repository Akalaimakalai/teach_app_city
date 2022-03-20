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

  describe 'POST #create' do
    let(:citizen) { build(:citizen) }

    describe 'Valid' do
      let(:params) { citizen.attributes }

      it 'creates new citizen' do
        expect { post :create, params: params }.to change(Citizen, :count).by(1)
      end

      it 'returns citizen json' do
        post :create, params: params
        expect(response.parsed_body).to eq(
          {
            'id' => Citizen.last.id,
            'name' => citizen.name,
            'age' => citizen.age,
            'gender' => citizen.gender,
            'state' => 'alive'
          }
        )
      end
    end

    describe 'Invalid' do
      let(:params) { citizen.attributes.merge(age: -5) }

      it { expect { post :create, params: params }.to raise_error(ActiveModel::ValidationError) }
    end
  end

  describe 'PUT #update' do
    let(:citizen) { create(:citizen) }

    describe 'Valid' do
      let(:params) { citizen.attributes.merge(state: 'dead') }

      it 'returns citizen json' do
        put :update, params: params
        expect(response.parsed_body).to eq(
          {
            'id' => Citizen.last.id,
            'name' => citizen.name,
            'age' => citizen.age,
            'gender' => citizen.gender,
            'state' => 'dead'
          }
        )
      end
    end

    describe 'Invalid' do
      let(:params) { citizen.attributes.merge(age: -5) }

      it { expect { put :update, params: params }.to raise_error(ActiveModel::ValidationError) }
    end
  end

  describe 'DELETE #destroy' do
    let!(:citizen) { create(:citizen) }

    describe 'Valid' do
      let(:params) { { id: citizen.id } }

      it 'delete the citizen' do
        expect { delete :destroy, params: params }.to change(Citizen, :count).by(-1)
      end

      it 'returns citizen json' do
        delete :destroy, params: params
        expect(response.parsed_body).to eq(
          {
            'id' => citizen.id,
            'name' => citizen.name,
            'age' => citizen.age,
            'gender' => citizen.gender,
            'state' => citizen.state
          }
        )
      end
    end

    describe 'Invalid' do
      let(:params) { { id: citizen.id + 8 } }

      it { expect { delete :destroy, params: params }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
