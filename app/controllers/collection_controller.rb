class CollectionController < ApplicationController
  def index
    @books = current_user.books if current_user
  end
end
