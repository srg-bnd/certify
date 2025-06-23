# frozen_string_literal: true

require 'rails_helper'

describe Domains::API, type: :api do
  describe 'GET /domains' do
    let!(:domains) { create_list(:domain, 3) }

    before do
      get api('domains')
    end

    context 'when unauthorized' do
      describe 'response' do
        subject { response }

        it { is_expected.to have_http_status :ok }
      end

      describe 'response' do
        subject { response }

        it { is_expected.to have_http_status :ok }

        describe 'parsed body' do
          subject { JSON.parse(super().body) }

          let(:expected_items) do
            domains.map do |domain|
              a_hash_including(
                'id' => domain.id,
                'name' => domain.name,
                'status' => domain.aasm_state,
                'status_info' => domain.state_info
              )
            end
          end

          let(:expected_body) { a_collection_containing_exactly(*expected_items) }

          it { is_expected.to match expected_body }
        end
      end
    end
  end
end
