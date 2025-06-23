# frozen_string_literal: true

require 'sidekiq-scheduler'

class CertificateVerificationJob < ApplicationJob
  def perform
    Domain.where(aasm_state: %i[ok bad unknown]).find_each do |domain|
      result = Domains::CertificateVerificationService.new(domain).call

      if result.success?
        domain.success!
      else
        domain.failure!(state_info: result.error_code)
      end
    end
  end
end
