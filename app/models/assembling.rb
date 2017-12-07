# frozen_string_literal: true

class Assembling < ApplicationRecord
  belongs_to :material
  belongs_to :item
  validates :percent, presence: true
  validates :material_id, presence: true
end
