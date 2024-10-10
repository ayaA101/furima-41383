class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only:[:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_record = OrderRecord.new
    if current_user.id == @item.user_id || @item.order != nil
      return redirect_to root_path
    end   
  end  

  def create
    @order_record = OrderRecord.new(order_params)
    if @order_record.valid?
       pay_item
       @order_record.save
         redirect_to root_path
    else
         gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
         render :index, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_record).permit(:postalcode, :prefecture_id, :city, :addresses, :building, :phonenumber).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
