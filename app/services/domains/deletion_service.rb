# frozen_string_literal: true

module Domains
  class DeletionService < Service
    def initialize(domain)
      @domain = domain
    end

    def call
      return form_error(@domain) unless @domain.destroy

      success(nil)
    end
  end
end
