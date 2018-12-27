require 'rails_helper'

RSpec.describe SuggestedUsersController, type: :controller do
  describe 'GET index' do
    subject { get :index }

    context 'when user is logged in' do
      let!(:user) { create(:user) }
      let(:twitter_manager_mock) { double('twitter_manager') }
      let(:twitter_client_mock) { double('twitter_client') }

      before do
        allow(TwitterManager).to receive(:new).and_return(twitter_manager_mock)
        allow(twitter_manager_mock).to receive(:client).and_return(twitter_client_mock)
        allow(twitter_client_mock).to receive(:users).and_return('mock')
        login_user user
        subject
      end

      it_behaves_like 'controller normal return', :index
      it { expect(assigns(:client)).to be_present }
      it { expect(assigns(:suggested_users)).to be_present }
    end

    context 'when user is not logged in' do
      it { expect(subject).to redirect_to root_path }
      it { subject; expect(assigns(:client)).not_to be_present }
      it { subject; expect(assigns(:suggested_users)).not_to be_present }
    end
  end
end
