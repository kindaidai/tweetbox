require 'rails_helper'

RSpec.describe TopController, type: :controller do
  describe 'GET index' do
    subject { get :index }

    context 'when user is logged in' do
      let!(:user) { create(:user) }
      let(:twitter_manager_mock) { double('twitter_manager') }
      let(:twitter_client_mock) { double('twitter_client') }

      before do
        allow(TwitterManager).to receive(:new).and_return(twitter_manager_mock)
        allow(twitter_manager_mock).to receive(:home_timeline).and_return('mock')
        login_user user
        subject
      end

      it_behaves_like 'controller normal return', :index
      it { expect(assigns(:tweets)).to be_present }
    end

    context 'when user is not logged in' do
      before { subject }
      it_behaves_like 'controller normal return', :index
      it { expect(assigns(:tweets)).not_to be_present }
    end
  end
end
