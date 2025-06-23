# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Domains::CertificateVerificationService, type: :service do
  let(:errors_domains) do
    [
      { name: 'expired.badssl.com' },
      { name: 'wrong.host.badssl.com' },
      { name: 'self-signed.badssl.com' },
      { name: 'untrusted-root.badssl.com' }
    ]
  end

  describe '#check' do
    it 'should return new for all domain' do
      Domain.create(errors_domains)
      expect(errors_domains.count).to eq(Domain.created.count)
    end
  end
end
