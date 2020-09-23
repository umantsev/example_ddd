# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersDomain::Serializers::FailureSerializer do
  subject { Application['users_domain.serializers.failure_serializer'].call(error_message) }

  let(:error_message) { 'error_message' }

  let(:expected_result) do
    {
      errors: [
        {
          status: '404',
          source: {
            pointer: '/data/id'
          },
          title: error_message,
          detail: error_message
        }
      ]
    }
  end

  it { expect(subject).to eq(JSON.dump(expected_result)) }
end
