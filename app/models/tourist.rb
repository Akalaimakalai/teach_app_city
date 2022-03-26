# frozen_string_literal: true

class Tourist < ApplicationRecord
  NAME_FORMAT = /\A[a-z ,.'-]+\z/i

  validates :name, format: { with: NAME_FORMAT }
  validates :name, length: { in: 2..200 }
end
