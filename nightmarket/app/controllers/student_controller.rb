class StudentController < ApplicationController
  def registration
    @group = Group.new
  end

  def post_registration
    @group = Group.new(group_params)
    @group.group_primary_email = @group.group_primary_email.downcase
    @group.year_participated = "2018"
    if @group.save
      redirect_to action: "registration_success"
    else
      render action: "registration"
    end
  end

  def registration_success

  end

  def dashboard
    if not current_user
      flash[:error] = "logged_out"
      redirect_to controller: "visit", action: "index"
      return
    end

    current_user = User.find(session[:user_id])
    @group = Group.find_by group_primary_email: current_user.email
  end

  def group_params
    params.require(:group).permit(:group_name, 
      :group_primary_email,
      :group_primary_phone,
      :group_primary_name,
      :group_secondary_phone,
      :group_secondary_name,
      :group_secondary_email,
      :group_food_information,
      :group_booth_size,
      :group_performance_information,
      :group_activity_information,
      :group_description,
      :group_website,
      :group_photo,
      :agreement)
  end

  def current_user
    return current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
