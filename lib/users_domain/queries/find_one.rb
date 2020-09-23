# frozen_string_literal: true

module UsersDomain
  module Queries
    class FindOne
      include Import[
        repository: 'users_domain.storage.repositories.user_repository'
      ]

      def call(user_id)
        repository.find(user_id)
      end
    end
  end
end
