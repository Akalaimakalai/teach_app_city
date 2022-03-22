# frozen_string_literal: true

module Citizens
  class UpdateCitizenForm < SaveCitizenForm
    attribute :state, String

    validates :state, inclusion: { in: Citizen::STATES }

    validate_id
  end
end
