# frozen_string_literal: true

class BaseForm
  include ::Virtus.model(nullify_blank: true)
  include ::ActiveModel::Validations
end
