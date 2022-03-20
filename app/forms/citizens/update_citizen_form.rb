# frozen_string_literal: true

module Citizens
  class UpdateCitizenForm < SaveCitizenForm
    attribute :id, Integer
    attribute :state, String

    validates :id, numericality: { greater_than: 0 }
    validates :state, inclusion: { in: Citizen::STATES }
  end
end
