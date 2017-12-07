# frozen_string_literal: true

class Selection < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
