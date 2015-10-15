class AddDetailsToVoterRegistrationActions < ActiveRecord::Migration
  def change
    rename_column :voter_registration_actions, :organiser, :organiser_name
    add_column :voter_registration_actions, :organiser_phone, :string
    add_column :voter_registration_actions, :organiser_phone_public, :boolean
    add_column :voter_registration_actions, :organiser_email, :string
    add_column :voter_registration_actions, :organiser_email_public, :boolean
    add_column :voter_registration_actions, :organiser_address, :text
    add_column :voter_registration_actions, :organiser_address_public, :boolean
    add_column :voter_registration_actions, :fb_event_page, :string
    add_column :voter_registration_actions, :url, :string
  end
end
