class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order 

  def index
    @orderrecord = OrderRecord.new
    if current_user.id == @item.user_id || @item.shopping_address != nil
      return redirect_to root_path
    end   
  end  

  def create
    @orderrecord = OrderRecord.new(order_params)
    if @orderrecord.valid?
       @orderrecord.save(params,current_user.id)
         redirect_to root_path
    else
         render :index
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_record).permit(:postalcode, :prefecture_id, :city, :addresses, :building, :phonenumber).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
