class CreateShortener < ActiveRecord::Migration[5.2]
  def change
    create_table :shorteners do |t|
      t.string :long_url
      t.string :short_url
    end
  end
end
