# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersDomain::Storage::Entities::UserEntity do
  subject { described_class.new(attributes) }

  context 'when attributes is valid' do
    let(:attributes) do
      {
        id: 1,
        first_name: 'first_name',
        last_name: 'last_name'
      }
    end

    it do
      expect(subject[:id]).to eq(attributes[:id])
      expect(subject[:first_name]).to eq(attributes[:first_name])
      expect(subject[:last_name]).to eq(attributes[:last_name])
    end
  end

  context 'when attributes is not valid' do
    let(:attributes) { {} }

    it do
      expect { subject }.to raise_error Dry::Struct::Error
    end
  end
end
