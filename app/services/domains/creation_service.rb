# frozen_string_literal: true

module Domains
  class CreationService < Service
    def call(params)
      domain = Domain.new(params)
      return form_error(domain) unless domain.save

      success(domain)
    end
  end
end
