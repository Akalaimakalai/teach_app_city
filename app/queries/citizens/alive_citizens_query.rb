# frozen_string_literal: true

module Citizens
  class AliveCitizensQuery
    def call(scope = Citizen.all)
      scope.where(state: 'alive')
    end
  end
end
