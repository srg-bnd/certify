# frozen_string_literal: true

module Domains
  class UntrackingService < Service
    def initialize(domain)
      @domain = domain
    end

    def call
      return error_data(:cannot_untrack) unless @domain.may_untrack?
      return form_error(@domain) unless @domain.untrack!

      success(@domain)
    end
  end
end
