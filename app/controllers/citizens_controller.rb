# frozen_string_literal: true

class CitizensController < ApplicationController
  def index
    render json: ::Citizens::IndexCitizens.new.call
  end
end
