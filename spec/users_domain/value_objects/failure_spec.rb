# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersDomain::ValueObjects::Failure do
  subject { described_class.new(attributes) }

  context 'when attributes is empty' do
    let(:attributes) { {} }

    it do
      expect { subject }.to raise_error Dry::Struct::Error
    end
  end

  context 'when errors array is empty' do
    let(:attributes) do
      {
        errors: []
      }
    end

    it { expect(subject.to_h).to eq(attributes) }
  end

  context 'when attributes is correct' do
    let(:error_message) { 'error_message' }

    let(:attributes) do
      {
        errors: [
          title: error_message,
          detail: error_message
        ]
      }
    end

    let(:expected_result) do
      {
        errors: [
          {
            status: '404',
            source: {
              pointer: '/data/id'
            },
            title: 'error_message',
            detail: 'error_message'
          }
        ]
      }
    end

    it { expect(subject.to_h).to eq(expected_result) }
  end
end
