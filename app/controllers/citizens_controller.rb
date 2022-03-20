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

  def update
    form = ::Citizens::UpdateCitizenForm.new(params.permit!)
    form.validate!

    use_case = ::Citizens::UpdateCitizen.new
    render json: use_case.call(form.attributes)
  end

  def destroy
    form = ::Citizens::DestroyCitizenForm.new(params.permit!)
    form.validate!

    use_case = ::Citizens::DestroyCitizen.new
    render json: use_case.call(form.attributes)
  end
end
