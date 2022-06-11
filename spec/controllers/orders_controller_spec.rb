# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before do
    allow(OrderPolicy).to receive(:new).and_return(order_policy)
  end

  let(:order_policy) do
    instance_double(OrderPolicy, index?: true, new?: true, create?: true, edit?: true, update?: true)
  end
  let(:new_order) { create(:order) }

  let(:order_params) do
    {
      name: Faker::Lorem.sentence(word_count: 5)
    }
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template(:index) }
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template(:new) }
  end

  describe 'POST create' do
    before do
      post :create, params: { order: order_params }
    end

    it { is_expected.to respond_with(:found) }
    it { is_expected.to redirect_to(orders_path) }
  end

  describe 'GET edit' do
    before do
      get :edit, params: { id: new_order.id }
    end

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template(:edit) }
  end

  describe 'PUT update' do
    before do
      put :update, params: { id: new_order.id, order: order_params }
    end

    it { is_expected.to respond_with(:found) }
    it { is_expected.to redirect_to(orders_path) }
  end
end
