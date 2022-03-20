# frozen_string_literal: true

class CitizenSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :state
end
