class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :load_user_using_perishable_token, :only => [:reset_password, :reset_password_submit]
  before_filter :require_admin, :only => [:index]
  
  def new
    @user = User.new
    @user.group = Group.new
  end
  
  def create
    @user = User.new(params[:user])
    
    @user.group = Group.find_or_create_by_name(params[:user][:group_attributes][:name])
    
    
    if @user.save_without_session_maintenance
      @user.send_activation_instructions!
      flash[:notice] = "Thank you for registering! You will receive activation instructions in your email."
      redirect_to signup_url
    else
      flash.now[:error] = "There was a problem creating your account."
      render :action => :show
    end
  end
  
  
  def activate
    @user = User.find_using_perishable_token(params[:activation_code], 1.week)
  
    if @user.activate!
      UserSession.create(@user, false)
      @user.send_activation_confirmation!
      redirect_to account_url
    else
      render :action  => :new
    end
  end
  
  def show
    @user = @current_user
  end
  
  def index
    @users = User.find(:all, :order => :name)
  end
  
  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => edit
    end
  end
  
  
  def reset_password
    @user = User.find_using_perishable_token(params[:reset_password_code], 1.week)
    
    render
  end
  
  def reset_password_submit
    @user = User.find_using_perishable_token(params[:reset_password_code], 1.week)
    
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated."
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  private
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:reset_password_code], 1.week)
    unless @user
      flash[:notice] = "Sorry, we could not locate your account."
      redirect_to login_url
    end
  end
  
end
