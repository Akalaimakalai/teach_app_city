# frozen_string_literal: true

module Citizens
  class DestroyCitizen
    def call(params)
      citizen = Citizen.find(params[:id])

      citizen.destroy!
    end
  end
end
