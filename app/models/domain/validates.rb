# frozen_string_literal: true

class Domain
  module Validates
    extend ActiveSupport::Concern

    included do
      validates :name, presence: true, uniqueness: true
    end
  end
end
