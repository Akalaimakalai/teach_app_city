# frozen_string_literal: true

module Citizens
  class SaveCitizenForm < BaseForm
    attribute :name, String
    attribute :age, Integer
    attribute :gender, String

    validates :name, format: { with: Citizen::NAME_FORMAT }, length: { in: 2..200 }
    validates :age, numericality: { greater_than_or_equal_to: 0 }
    validates :gender, inclusion: { in: Citizen::GENDERS }
  end
end
