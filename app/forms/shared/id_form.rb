# frozen_string_literal: true

module Shared
  class IdForm < BaseForm
    attribute :id, Integer

    validates :id, numericality: { greater_than: 0 }
  end
end
