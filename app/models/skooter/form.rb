module Skooter
  class Form < ApplicationRecord
    has_attached_file :document
    validates_attachment_content_type :document,
                                      content_type: 'application/xml'
    validates_attachment_size :document, in: 0..20.kilobytes
  end
end
