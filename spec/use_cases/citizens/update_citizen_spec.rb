# frozen_string_literal: true

RSpec.describe Citizens::UpdateCitizen do
  let(:citizen) { create(:citizen) }

  describe 'Valid' do
    let(:params) { { id: citizen.id, state: 'dead' } }

    it { expect { subject.call(params) }.to change { Citizen.find(citizen.id).state }.from('alive').to('dead') }
  end

  describe 'Invalid' do
    context 'unexeptable params' do
      let(:params) { { id: citizen.id, state: 'flew to the moon' } }

      it do
        expect { subject.call(params) }.to_not change { Citizen.find(citizen.id).state }.from('alive')
      rescue ActiveRecord::RecordInvalid
        nil
      end
    end

    context 'unexisting citizen' do
      let(:params) { { id: citizen.id + 8 } }

      it { expect { subject.call(params) }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
