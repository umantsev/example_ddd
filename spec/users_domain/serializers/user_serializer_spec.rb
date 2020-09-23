# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersDomain::Serializers::UserSerializer do
  subject { described_class.new(user).serialized_json }

  context 'when user exists' do
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

    it { expect(JSON.parse(subject)).to eq(expected_result) }
  end
end
