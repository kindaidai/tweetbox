require 'rails_helper'

RSpec.describe Twitter::TweetsController, type: :controller do
  describe 'POST create' do
    subject { post :create, params: { tweet_id: tweet_id } }

    context 'when user is logged in' do
      let!(:user) { create(:user) }
      before do
        login_user user
      end

      context 'and params is valid' do
        let(:tweet_id) { Faker::Number.number(10) }
        
        it { expect{ subject }.to change(Tweet, :count).by(1) }
        it { expect(subject).to redirect_to root_path }
      end

      context 'and params is invalid' do
        let(:tweet_id) { 'invalid_tweet_id' }

        it { expect{ subject }.to change(Tweet, :count).by(0) }
        it { expect(subject).to redirect_to root_path }
      end
    end

    context 'when user is not logged in' do
      let(:tweet_id) { Faker::Number.number(10) }
      it { expect{ subject }.to change(Tweet, :count).by(0) }
      it { expect(subject).to redirect_to root_path }
    end
  end
end
