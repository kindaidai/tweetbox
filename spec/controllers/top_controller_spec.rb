require 'rails_helper'

RSpec.describe TopController, type: :controller do
  describe 'GET index' do
    before { get :index }
    it_behaves_like 'controller normal return', :index
  end
end
