class Appearance < ActiveRecord::Base
      # t.integer :race_id
      # t.integer :user_id
      # t.timestamps

  belongs_to :race
  belongs_to :user

end
