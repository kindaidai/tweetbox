class SuggestedUsersController < ApplicationController
  before_action :require_login
  SUGGESTED_USERS = ["jack", "yukihiro_matz", "JeffBezos"].freeze

  def index
    manager = TwitterManager.new(current_user)
    @client = manager.client
    @suggested_users = @client.users(SUGGESTED_USERS)
  end
end
