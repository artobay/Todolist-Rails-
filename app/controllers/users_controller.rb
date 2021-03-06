class UsersController < ApplicationController
    
   
 def new
    @user = User.new
 end
 
  def create
   @user = User.new
   @user.name = params[:user][:name]
   @user.email = params[:user][:email]
   @user.password = params[:user][:password]
   @user.password_confirmation = params[:user][:password_confirmation]
        
   if @user.save
     flash[:notice] = "Welcome to Blocitoff #{@user.name}"
     create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating you account. Please try again."
      render :new
   end
  end  
 
   def show
    if current_user.present?  
      @user = current_user
      @item = Item.new
      @items = @user.items
    else
      redirect_to new_user_registration_path
    end  
   end


  def destroy
  end
end
    

