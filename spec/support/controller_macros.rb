require 'rails_helper'

shared_examples 'controller normal return' do |action|
  it { expect(response).to be_successful }
  it { expect(response).to render_template action } if action
end
