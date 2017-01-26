class VendorController < ApplicationController
  def index
    @vendor = Vendor.new
  end

  def post_registration
    @vendor = Vendor.new(vendor_params)
    @vendor.vendor_primary_email = @vendor.vendor_primary_email.downcase
    @vendor.year_participated = "2017"
    if @vendor.save
      redirect_to action: "registration_success"
    else
      render action: "index"
    end
  end

  def registration_success
    
  end

  def login
    if(!session[:current_vendor_id].nil? && !session[:current_vendor_email].nil?)
      redirect_to action: "view_registration"
    end

    @vendor = Vendor.new
  end

  def post_login
    if(params[:vendor].nil? or params[:vendor][:vendor_primary_email].nil? or params[:vendor][:pass].nil?)
      flash[:login_msg] = "Username and/or password is incorrect."
      render :login
      return
    end

    @vendor = Vendor.new
    @vendor.vendor_primary_email = params[:vendor][:vendor_primary_email]
    @loggedInUser = Vendor.find_by vendor_primary_email: params[:vendor][:vendor_primary_email]

    if !@loggedInUser.nil? && @loggedInUser.password_valid?(params[:vendor][:pass])
      flash[:login_msg] = nil
      session[:current_vendor_id] = @loggedInUser.id
      session[:current_vendor_email] = @loggedInUser.vendor_primary_email
      redirect_to action: "view_registration"
      return
    end

    flash[:login_msg] = "Username and/or password is incorrect."
    render :login
  end

  def view_registration
    @vendor = Vendor.find_by id: session[:current_vendor_id]
  end

  def logout
    session[:current_vendor_email] = nil
    session[:current_vendor_id] = nil

    redirect_to action: "login"
  end

  def vendor_params
    params.require(:vendor).permit(:vendor_name, 
      :vendor_address,
      :vendor_primary_email,
      :vendor_primary_phone,
      :vendor_primary_name,
      :vendor_secondary_phone,
      :vendor_secondary_name,
      :vendor_secondary_email,
      :vendor_food_information,
      :vendor_description,
      :vendor_website,
      :vendor_photo,
      :pass,
      :pass_confirmation, 
      :agreement)
  end
end
