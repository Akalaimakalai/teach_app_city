# frozen_string_literal: true

module Citizens
  class UpdateCitizen
    def call(params)
      citizen = Citizen.find(params[:id])

      citizen.update!(params)

      citizen
    end
  end
end
