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
