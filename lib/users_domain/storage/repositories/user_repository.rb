# frozen_string_literal: true

module UsersDomain
  module Storage
    module Repositories
      class UserRepository
        def find(user_id)
          user = UsersDomain::Storage::Models::User.find_by(id: user_id)

          return unless user

          UsersDomain::Storage::Entities::UserEntity.new(user.attributes.symbolize_keys)
        end
      end
    end
  end
end
