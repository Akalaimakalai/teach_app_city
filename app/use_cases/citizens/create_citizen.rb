# frozen_string_literal: true

module Citizens
  class CreateCitizen
    BaseError = Class.new(StandardError)
    NotUniqNameError = Class.new(BaseError)

    def call(params)
      @params = params

      validate_uniqueness_of_name
      create_new_citizen
    end

    private

    def validate_uniqueness_of_name
      return unless Citizen.exists?(name: @params[:name])

      raise NotUniqNameError, 'Имя не уникально'
    end

    def create_new_citizen
      Citizen.create!(@params.merge(state: 'alive'))
    end
  end
end
