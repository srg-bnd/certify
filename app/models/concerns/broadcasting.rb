# frozen_string_literal: true

module Broadcasting
  extend ActiveSupport::Concern

  included do
    after_create_commit :broadcast_create
    after_update_commit :broadcast_update
  end

  def broadcast_create
    broadcast_changes(:create)
  end

  def broadcast_update
    broadcast_changes(:update)
  end

  private

  def broadcast_changes(action_type)
    ActionCable.server.broadcast channel_name, format_broadcast_data(action_type)
  end

  def channel_name(model: self)
    "#{model.class.name.pluralize}Channel".constantize
  end

  def entity_name(model: self)
    JSON.parse("#{model.class.name.pluralize}::#{model.class.name}Entity".constantize.represent(model).to_json)
  end

  def format_broadcast_data(action_type, model: self)
    {
      identifier: channel_name(model:),
      message_type: action_type,
      message: entity_name(model:)
    }
  end
end
