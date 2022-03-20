# frozen_string_literal: true

RSpec.describe BaseForm do
  subject { form_class.new(params) }

  let(:form_class) do
    Class.new(described_class) do
      attribute :number, Integer
      attribute :text, String
      attribute :int_arr, Array[Integer]
    end
  end
  let(:params) do
    {
      number: 123,
      text: 'test text',
      excess_param: :value
    }
  end

  it 'returns attributes' do
    expect(subject.attributes).to eq(
      number: 123,
      text: 'test text',
      int_arr: []
    )
  end
end
