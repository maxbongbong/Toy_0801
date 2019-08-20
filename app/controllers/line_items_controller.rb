class LineItemsController < ApplicationController
  before_action :check_current_user

  def add_cart
    product = Product.where(id: params[:product_id]).first
    get_cart.line_items.create(product: product, quantity: 1, amount: product.price)
    redirect_to cart_orders_path
  end

  def update_amount
    line_item = LineItem.where(id: params[:line_item_id]).first
    if line_item && params[:quantity].present?
      line_item.update quantity: params[:quantity], amount: line_item.product.price*params[:quantity].to_i
    end
  end

  def destroy
    line_item = LineItem.where(id: params[:id]).first
    line_item.destroy
    redirect_to cart_orders_path
  end

  def check_current_user
    redirect_to new_user_session_path unless current_user
  end
end
