# frozen_string_literal: true

class Material < ApplicationRecord
  has_many :assemblings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
