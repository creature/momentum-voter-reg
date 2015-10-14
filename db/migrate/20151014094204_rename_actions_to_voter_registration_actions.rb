class RenameActionsToVoterRegistrationActions < ActiveRecord::Migration
  def change
    rename_table :actions, :voter_registration_actions
  end
end
