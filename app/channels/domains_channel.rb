# frozen_string_literal: true

class DomainsChannel < ApplicationCable::Channel
  def subscribed
    stream_from self.class.to_s
  end
end
