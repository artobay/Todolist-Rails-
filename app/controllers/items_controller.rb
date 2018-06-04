class ItemsController < ApplicationController
    
    def create
    current_user.items << Item.create(name: params[:item][:name])
    redirect_to current_user
    end

    def destroy

   @item = Item.find(params[:id])
   if @item.destroy
     flash[:notice] = "\"#{@item.name}\" was deleted successfully."
   else
     flash.now[:alert] = "There was an error deleting the item."
   
   end
   
    respond_to do |format|
    format.html
    format.js
  end
    
    end
end
