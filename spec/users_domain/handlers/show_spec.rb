# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersDomain::Handlers::Show do
  subject { Application['users_domain.handlers.show'].call(user_id) }

  context 'when user exists' do
    let(:user_id) { user.id }
    let(:user) { create(:user) }

    let(:expected_result) do
      {
        'data' => {
          'id' => user.id.to_s,
          'type' => 'user',
          'attributes' => {
            'first_name' => user.first_name,
            'last_name' => user.last_name
          }
        }
      }
    end

    it do
      expect(subject).to be_a(Dry::Monads::Success)
      expect(JSON.parse(subject.value!)).to eq(expected_result)
    end
  end

  context 'when user not found' do
    let(:user_id) { '0' }

    it do
      expect(subject).to be_a(Dry::Monads::Failure)
      expect(subject.failure).to eq(:user_not_found)
    end
  end
end
