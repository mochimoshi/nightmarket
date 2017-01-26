class AdminController < ApplicationController
  def dashboard
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @authorizedUsers = AuthorizedStudent.all
  end

  def add_new_authorized_user
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end
    
    student = AuthorizedStudent.new
    student.email = params[:authorized_student][:email].downcase
    student.role = "member"
    student.save!

    redirect_to action: "dashboard"
  end

  def remove_authorized_user
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @user = AuthorizedStudent.find_by id: params[:id]
    if @user.nil? and @user.role != "member"
      flash[:error] = "User not found"
      redirect_to action: "dashboard"
      return
    end

    AuthorizedStudent.destroy params[:id]

    flash[:success] = "User deleted."
    redirect_to action: "dashboard"
  end

  def vendor
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @vendors = Vendor.all
  end

  def remove_vendor
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @vendor = Vendor.find_by id: params[:id]
    if @vendor.nil? and @vendor.year_participated != "2017"
      flash[:error] = "Vendor not found"
      redirect_to action: "vendor"
      return
    end

    Vendor.destroy params[:id]

    flash[:success] = "Vendor deleted."
    redirect_to action: "vendor"
  end

  def approve_vendor
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @vendor = Vendor.find_by id: params[:id]
    if @vendor.nil? and @vendor.year_participated != "2017"
      flash[:error] = "Vendor not found"
      redirect_to action: "vendor"
      return
    end

    @vendor.approved = true
    @vendor.save(validate: false)

    redirect_to action: "vendor"
  end

  def reject_vendor
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @vendor = Vendor.find_by id: params[:id]
    if @vendor.nil? and @vendor.year_participated != "2017"
      flash[:error] = "Vendor not found"
      redirect_to action: "vendor"
      return
    end

    @vendor.approved = false
    @vendor.save(validate: false)

    redirect_to action: "vendor"
  end

  private
  def current_user
    return current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
