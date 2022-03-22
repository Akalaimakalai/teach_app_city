# frozen_string_literal: true

class BaseForm
  include ::Virtus.model(nullify_blank: true)
  include ::ActiveModel::Validations

  def self.validate_id
    attribute :id, Integer
    validates :id, numericality: { greater_than: 0 }
  end
end
