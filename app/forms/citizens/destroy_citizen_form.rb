# frozen_string_literal: true

module Citizens
  class DestroyCitizenForm < BaseForm
    attribute :id, Integer

    validates :id, numericality: { greater_than: 0 }
  end
end
