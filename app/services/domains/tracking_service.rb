# frozen_string_literal: true

module Domains
  class TrackingService < Service
    def initialize(domain)
      @domain = domain
    end

    def call
      return error_data(:cannot_track) unless @domain.may_track?
      return form_error(@domain) unless @domain.track!

      success(@domain)
    end
  end
end
