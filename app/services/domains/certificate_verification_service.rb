# frozen_string_literal: true

module Domains
  class CertificateVerificationService < Service
    ERRORS = CertificateVerificationErrorCodes
    HAS_EXPIRED = 'certificate has expired'
    UNABLE_CERT = 'unable to get local issuer certificate'

    def initialize(domain)
      @domain = domain
    end

    def call
      error_code_verification = certificate_verification(@domain.name)
      return error_code(error_code_verification) if error_code_verification

      success(nil)
    end

    private

    def certificate_verification(domain_name)
      result = SSL::CertificateVerification.new(domain_name).check
    rescue OpenSSL::SSL::SSLError => e
      return ERRORS::EXPIRED if e.message.include?(HAS_EXPIRED)
      return ERRORS::CONNECTION_FAILED if e.message.include?(UNABLE_CERT)

      ErrorCodes::ERROR
    rescue StandardError => _e
      ErrorCodes::ERROR
    else
      checking_params(result)
    end

    def checking_params(result)
      valid_until = result.dig(:cert, :valid_until)
      number_of_weeks = (valid_until - Time.zone.now).weeks

      if number_of_weeks < 1.week
        ERRORS::EXPIRES_IN_LESS_THAN_1_WEEK
      elsif number_of_weeks < 2.weeks
        ERRORS::EXPIRES_IN_LESS_THAN_2_WEEK
      elsif !result[:verify_certificate_identity]
        ERRORS::ERROR_SSL
      end
    end
  end
end
