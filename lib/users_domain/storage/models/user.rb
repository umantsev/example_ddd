# frozen_string_literal: true

module UsersDomain
  module Storage
    module Models
      class User < ActiveRecord::Base
        self.table_name = 'users'
      end
    end
  end
end
