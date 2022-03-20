# frozen_string_literal: true

module Citizens
  class IndexCitizens
    def initialize(alive_citizens_query: ::Citizens::AliveCitizensQuery.new)
      @alive_citizens_query = alive_citizens_query
    end

    def call
      @alive_citizens_query.call
    end
  end
end
