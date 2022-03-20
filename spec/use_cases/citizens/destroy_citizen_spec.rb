# frozen_string_literal: true

RSpec.describe Citizens::DestroyCitizen do
  let!(:citizen) { create(:citizen) }

  describe 'Valid' do
    let(:params) { { id: citizen.id } }

    it { expect { subject.call(params) }.to change(Citizen, :count).by(-1) }
  end

  describe 'Invalid' do
    let(:params) { { id: citizen.id + 8 } }

    it { expect { subject.call(params) }.to raise_error(ActiveRecord::RecordNotFound) }
  end
end
