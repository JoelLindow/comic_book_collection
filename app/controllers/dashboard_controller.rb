class DashboardController < ApplicationController
  before_action :logged_in, only: [:index]

  def index
    @user = current_user
  end
end
