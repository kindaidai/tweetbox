require 'rails_helper'

RSpec.describe Twitter::FollowersController, type: :controller do
  describe 'POST create' do
    subject { post :create, params: { screen_name: _params } }
    let(:_params) { 'dummy_screen_name' }

    context 'when user is logged in' do
      let!(:user) { create(:user) }
      let(:twitter_manager_mock) { double('twitter_manager') }
      let(:twitter_client_mock) { double('twitter_client') }

      before do
        allow(TwitterManager).to receive(:new).and_return(twitter_manager_mock)
        allow(twitter_manager_mock).to receive(:client).and_return(twitter_client_mock)
        allow(twitter_client_mock).to receive(:follow)
        login_user user
        subject
      end

      it { expect(assigns(:client)).to be_present }
      it { expect(twitter_client_mock).to have_received(:follow) }
    end

    context 'when user is not logged in' do
      it { expect(subject).to redirect_to root_path }
      it { subject; expect(assigns(:client)).not_to be_present }
    end
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: { screen_name: _params } }
    let(:_params) { 'dummy_screen_name' }

    context 'when user is logged in' do
      let!(:user) { create(:user) }
      let(:twitter_manager_mock) { double('twitter_manager') }
      let(:twitter_client_mock) { double('twitter_client') }

      before do
        allow(TwitterManager).to receive(:new).and_return(twitter_manager_mock)
        allow(twitter_manager_mock).to receive(:client).and_return(twitter_client_mock)
        allow(twitter_client_mock).to receive(:unfollow)
        login_user user
        subject
      end

      it { expect(assigns(:client)).to be_present }
      it { expect(twitter_client_mock).to have_received(:unfollow) }
    end

    context 'when user is not logged in' do
      it { expect(subject).to redirect_to root_path }
      it { subject; expect(assigns(:client)).not_to be_present }
    end
  end
end
