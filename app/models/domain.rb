# frozen_string_literal: true

class Domain < ApplicationRecord
  include Validates
  include StateMachine
  include Broadcasting
end
