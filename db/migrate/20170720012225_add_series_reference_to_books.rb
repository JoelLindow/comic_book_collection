class AddSeriesReferenceToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :series, index: true
  end
end
