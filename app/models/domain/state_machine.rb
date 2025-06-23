# frozen_string_literal: true

class Domain
  module StateMachine
    extend ActiveSupport::Concern

    included do
      include AASM

      aasm do
        state :unknown, initial: true
        state :ok
        state :bad
        state :untracked

        event :success do
          transitions from: %i[ok bad unknown], to: :ok do
            after do |_kwargs|
              assign_attributes(state_info: nil)
            end
          end
        end

        event :failure do
          transitions from: %i[ok bad unknown], to: :bad do
            after do |kwargs = {}|
              assign_attributes(state_info: kwargs[:state_info])
            end
          end
        end

        event :track do
          transitions from: :untracked, to: :unknown do
            after do |_kwargs|
              assign_attributes(state_info: nil)
            end
          end
        end

        event :untrack do
          transitions from: %i[ok bad unknown], to: :untracked do
            after do |_kwargs|
              assign_attributes(state_info: nil)
            end
          end
        end
      end
    end
  end
end
