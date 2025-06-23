# frozen_string_literal: true

module Helpers
  module API
    def api(path, version = 'v1')
      "/api/#{version}/#{path}"
    end
  end
end
