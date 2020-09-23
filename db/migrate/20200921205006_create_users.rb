# frozen_string_literal: true

require_relative '../../system/import'

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
    end

    UsersDomain::Storage::Models::User.create!(
      first_name: :first_name,
      last_name: :last_name
    )
  end
end
