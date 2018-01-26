# This migration comes from skooter (originally 20180122173132)
class AddAttachmentDocumentToForms < ActiveRecord::Migration[5.1]
  def self.up
    change_table :skooter_forms do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :skooter_forms, :document
  end
end
