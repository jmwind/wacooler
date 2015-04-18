class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    User.find_each do |user|
      user.username = user.name[0..15].gsub(/\s+/, "")
      user.save!
    end
  end
end
