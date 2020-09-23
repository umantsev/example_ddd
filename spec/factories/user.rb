# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: UsersDomain::Storage::Models::User do
    first_name { 'John' }
    last_name  { 'Doe' }
  end
end
