# frozen_string_literal: true

module Citizens
  class UpdateCitizenForm < SaveCitizenForm
    attribute :id, Integer
    attribute :state, String

    validates :state, inclusion: { in: Citizen::STATES }
    validates :id, numericality: { greater_than: 0 }
  end
end
