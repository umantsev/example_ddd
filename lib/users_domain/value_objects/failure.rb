# frozen_string_literal: true

module UsersDomain
  module ValueObjects
    class Failure < Dry::Struct
      attribute :errors, Types::Array do
        attribute :status, Types::String.default('404')

        attribute :source, Types::Hash.schema(
          pointer: Types::String
        ).default(
          {
            pointer: '/data/id'
          }.freeze
        )

        attribute :title, Types::String
        attribute :detail, Types::String
      end
    end
  end
end
