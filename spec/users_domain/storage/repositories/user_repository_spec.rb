# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersDomain::Storage::Repositories::UserRepository do
  subject { Application['users_domain.storage.repositories.user_repository'].find(user_id) }

  context '#find' do
    context 'when user exists' do
      let(:user_id) { user.id }
      let(:user) { create(:user) }

      it do
        expect(subject).to be_a(UsersDomain::Storage::Entities::UserEntity)

        expect(subject[:id]).to eq(user.id)
        expect(subject[:first_name]).to eq(user.first_name)
        expect(subject[:last_name]).to eq(user.last_name)
      end
    end

    context 'when user not found' do
      let(:user_id) { '0' }

      it { expect(subject).to be_nil }
    end
  end
end
