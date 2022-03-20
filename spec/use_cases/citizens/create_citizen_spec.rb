# frozen_string_literal: true

RSpec.describe Citizens::CreateCitizen do
  describe 'Valid' do
    let(:params) do
      {
        name: Faker::Name.unique.name,
        age: Faker::Number.non_zero_digit,
        gender: 'male'
      }
    end

    it { expect { subject.call(params) }.to change(Citizen, :count).by(1) }
    it { expect(subject.call(params).state).to eq('alive') }
  end

  describe 'Invalid' do
    context 'not uniq name' do
      let(:params) do
        {
          name: 'Vovochka',
          age: Faker::Number.non_zero_digit,
          gender: 'male'
        }
      end

      before { create(:citizen, name: 'Vovochka') }

      it { expect { subject.call(params) }.to raise_error(described_class::NotUniqNameError) }
    end
  end
end
