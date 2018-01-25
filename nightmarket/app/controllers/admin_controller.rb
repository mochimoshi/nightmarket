class AdminController < ApplicationController
  def dashboard
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @authorizedUsers = AuthorizedStudent.all

    @isGroup = is_current_user_in_student_group
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
    @isGroup = is_current_user_in_student_group
  end

  def remove_vendor
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @vendor = Vendor.find_by id: params[:id]
    if @vendor.nil? and @vendor.year_participated != "2018"
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
    if @vendor.nil? and @vendor.year_participated != "2018"
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
    if @vendor.nil? and @vendor.year_participated != "2018"
      flash[:error] = "Vendor not found"
      redirect_to action: "vendor"
      return
    end

    @vendor.approved = false
    @vendor.save(validate: false)

    redirect_to action: "vendor"
  end

  def group
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @groups = Group.all
    @isGroup = is_current_user_in_student_group
  end

  def remove_group
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @group = Group.find_by id: params[:id]
    if @group.nil? and @group.year_participated != "2018"
      flash[:error] = "Group not found"
      redirect_to action: "group"
      return
    end

    Group.destroy params[:id]

    flash[:success] = "Group deleted."
    redirect_to action: "group"
  end

  def approve_group
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @group = Group.find_by id: params[:id]
    if @group.nil? and @vendor.year_participated != "2018"
      flash[:error] = "Group not found"
      redirect_to action: "group"
      return
    end

    @group.approved = true
    @group.save(validate: false)

    redirect_to action: "group"
  end

  def reject_group
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    @group = Group.find_by id: params[:id]
    if @group.nil? and @group.year_participated != "2018"
      flash[:error] = "Group not found"
      redirect_to action: "group"
      return
    end

    @group.approved = false
    @group.save(validate: false)

    redirect_to action: "group"
  end

  private
  def current_user
    user = User.find(session[:user_id]) if session[:user_id]
    return current_user ||= user if AuthorizedStudent.find_by email: user.email
  end

  def is_current_user_in_student_group
    user = User.find(session[:user_id])
    group = Group.find_by group_primary_email: user.email
    return group.nil? == false
  end
end
