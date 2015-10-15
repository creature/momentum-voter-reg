class AddPublishedFieldToVoterRegistrationActions < ActiveRecord::Migration
  def change
    add_column :voter_registration_actions, :published, :boolean, null: false, default: false
  end
end
