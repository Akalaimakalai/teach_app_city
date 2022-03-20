# frozen_string_literal: true

class CitizensController < ApplicationController
  def index
    render json: ::Citizens::IndexCitizens.new.call
  end

  def create
    form = ::Citizens::SaveCitizenForm.new(params.permit!)
    form.validate!

    use_case = ::Citizens::CreateCitizen.new
    render json: use_case.call(form.attributes)
  end
end
