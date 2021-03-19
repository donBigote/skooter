module Skooter
  class Form < ApplicationRecord

    has_one_attached :document

  end
end