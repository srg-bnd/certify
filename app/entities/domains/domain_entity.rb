# frozen_string_literal: true

module Domains
  class DomainEntity < Grape::Entity
    expose :id
    expose :name
    expose :aasm_state, as: :status
    expose :state_info, as: :status_info

    expose :created_at
    expose :updated_at
  end
end
