class DashboardController < ApplicationController
  before_action :logged_in, only: [:index]

  def index
    @user = current_user
    @user_ten_recent = @user.ten_recent_books
    @database_ten_recent = Book.ten_recent
  end
end
