# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
