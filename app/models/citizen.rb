# frozen_string_literal: true

class Citizen < ApplicationRecord
  include ::NativeSpeaking

  NAME_FORMAT = /\A[a-z ,.'-]+\z/i
  GENDERS = %w[male female].freeze
  STATES = %w[alive dead].freeze

  validates :name, format: { with: NAME_FORMAT }
  validates :name, length: { in: 2..200 }

  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :gender, inclusion: { in: GENDERS }

  validates :state, inclusion: { in: STATES }
end
