# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:product_number).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:state).of_type(:integer) }
    it { is_expected.to have_db_column(:delivered_at).of_type(:datetime) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:state) }
  end
end
