# frozen_string_literal: true

class CitizensController < ApplicationController
  before_action :authenticate_user!

  def index
    @citizens = ::Citizens::IndexCitizens.new.call
  end

  def new
    @citizen = Citizen.new
  end

  def create
    attributes = HashWithIndifferentAccess.new(params['citizen'].permit!)

    form = ::Citizens::SaveCitizenForm.new(attributes)
    form.validate!

    use_case = ::Citizens::CreateCitizen.new
    use_case.call(form.attributes)
  rescue StandardError => exception
    Rails.logger.info "Exception was thrown: #{exception.message}"
  ensure
    redirect_to root_path
  end

  def edit
    form = Shared::IdForm.new(params.permit!)
    @citizen = Citizen.find_by(form.attributes)
  end

  def update
    attributes = HashWithIndifferentAccess.new(params['citizen'].permit!)

    form = ::Citizens::UpdateCitizenForm.new(attributes)
    form.validate!

    use_case = ::Citizens::UpdateCitizen.new
    use_case.call(form.attributes)
  rescue StandardError => exception
    Rails.logger.info "Exception was thrown: #{exception.message}"
  ensure
    redirect_to root_path
  end

  def destroy
    form = Shared::IdForm.new(params.permit!)
    form.validate!

    use_case = ::Citizens::DestroyCitizen.new
    use_case.call(form.attributes)
  rescue StandardError => exception
    Rails.logger.info "Exception was thrown: #{exception.message}"
  ensure
    redirect_to root_path
  end
end
