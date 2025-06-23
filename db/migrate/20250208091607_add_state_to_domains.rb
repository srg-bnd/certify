# frozen_string_literal: true

class AddStateToDomains < ActiveRecord::Migration[6.0]
  def change
    change_table :domains do |t|
      t.string :aasm_state, null: false, index: true
      t.string :state_info
    end
  end
end
