class RemoveOrganiserAddressPublicFromVoterRegistrationActions < ActiveRecord::Migration
  def change
    remove_column :voter_registration_actions, :organiser_address_public, :boolean
  end
end
