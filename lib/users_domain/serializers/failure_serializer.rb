# frozen_string_literal: true

module UsersDomain
  module Serializers
    class FailureSerializer
      def call(error_message)
        failure = UsersDomain::ValueObjects::Failure.new(
          errors: [
            {
              title: error_message.to_s,
              detail: error_message.to_s
            }
          ]
        ).to_h

        JSON.dump(failure)
      end
    end
  end
end
