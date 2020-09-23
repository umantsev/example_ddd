# frozen_string_literal: true

module UsersDomain
  module Serializers
    class MonadSerializer
      include Import[
        failure_serializer: 'users_domain.serializers.failure_serializer'
      ]

      def call(result)
        if result.success?
          result.value!
        else
          failure_serializer.call(result.failure)
        end
      end
    end
  end
end
