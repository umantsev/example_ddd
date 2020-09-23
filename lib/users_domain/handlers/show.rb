# frozen_string_literal: true

require 'dry-monads'
require 'dry/monads/do'

module UsersDomain
  module Handlers
    class Show
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      include Import[
        query: 'users_domain.queries.find_one'
      ]

      def call(user_id)
        user = yield find_user(user_id)
        serialize(user)
      end

      private

      def find_user(user_id)
        user = query.call(user_id)

        if user.present?
          Success(user)
        else
          Failure(:user_not_found)
        end
      end

      def serialize(user)
        serialized_json = UsersDomain::Serializers::UserSerializer.new(user).serialized_json

        Success(serialized_json)
      end
    end
  end
end
