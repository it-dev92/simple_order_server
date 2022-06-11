# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[edit update]

  def index
    authorize_action

    @q = Order.ransack(params[:q])
    @orders = @q.result.order(created_at: :desc)

    render :index
  end

  def new
    authorize_action

    @order = Order.new

    render :new
  end

  def create
    authorize_action

    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new, locals: { order: @order }
    end
  end

  def edit
    authorize_action

    render :edit
  end

  def update
    authorize_action

    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit, locals: { order: @order }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def authorize_action(record = Order)
    authorize(record, "#{action_name}?", policy_class: policy_class)
  end

  def policy_class
    OrderPolicy
  end

  def order_params
    params.require(:order).permit(:name, :state)
  end
end
