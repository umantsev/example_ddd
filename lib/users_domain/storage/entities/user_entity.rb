# frozen_string_literal: true

module UsersDomain
  module Storage
    module Entities
      class UserEntity < Dry::Struct
        attribute :id, Types::Integer
        attribute :first_name, Types::String
        attribute :last_name, Types::String
      end
    end
  end
end
