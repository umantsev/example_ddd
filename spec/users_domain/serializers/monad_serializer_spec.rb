# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersDomain::Serializers::MonadSerializer do
  subject { Application['users_domain.serializers.monad_serializer'].call(result) }

  context 'when result is success' do
    let(:result) { Dry::Monads::Success(:success) }

    it { expect(subject).to eq(:success) }
  end

  context 'when result is failure' do
    let(:error_message) { :failure }

    let(:result) { Dry::Monads::Failure(error_message) }

    let(:expected_result) do
      {
        errors: [
          {
            status: '404',
            source: {
              pointer: '/data/id'
            },
            title: error_message.to_s,
            detail: error_message.to_s
          }
        ]
      }
    end

    it { expect(subject).to eq(JSON.dump(expected_result)) }
  end
end
