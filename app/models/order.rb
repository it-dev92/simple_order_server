# frozen_string_literal: true

class Order < ApplicationRecord
  validates :product_number, :name, :state, presence: true
  validates :product_number, uniqueness: true

  enum state: { pending: 0, progress: 1, complete: 2 }

  before_validation :generate_product_number
  before_save :set_delivered_at

  private

  def generate_product_number
    self.product_number = ['PD', Time.current.to_i].join('-') if product_number.nil?
  end

  def set_delivered_at
    self.delivered_at = (Time.current if state == 'complete')
  end
end
