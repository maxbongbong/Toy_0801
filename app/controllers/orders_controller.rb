class OrdersController < ApplicationController
  before_action :load_object, only: [:show, :destroy]
  before_action :check_current_user

  def index
    @orders = current_user.orders
  end

  def show; end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def cart
  end

  def payment
  end

  def payment_completed
  end

private

  def order_params
    params.require(:order).permit(:number, :amount, :completed_at, :address_1, :address_2, :state, :note, :paied_at, :user_id, :payment_amount)
  end

  def load_object
    @order = Order.where(id: params[:id]).first
  end

  def check_current_user
    redirect_to root_path unless current_user
  end
end
