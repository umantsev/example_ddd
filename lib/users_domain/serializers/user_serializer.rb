# frozen_string_literal: true

require 'fast_jsonapi'

module UsersDomain
  module Serializers
    class UserSerializer
      include FastJsonapi::ObjectSerializer

      attributes :first_name, :last_name
    end
  end
end
