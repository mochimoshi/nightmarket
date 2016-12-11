class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    hosted_domain = auth.extra.raw_info.hd

    if hosted_domain != "stanford.edu" && hosted_domain != "alumni.stanford.edu"
      flash[:error] = "unauthorized_domain"
      redirect_to controller: "visit", action: "index"
      return
    end

    authorized_user = AuthorizedStudent.find_by email: auth.info.email
    if authorized_user.nil?
      flash[:error] = "unauthorized_user"
      redirect_to controller: "visit", action: "index"
      return
    end
    
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to controller: "admin", action: "dashboard"
  end

  def destroy
    session[:user_id] = nil
    redirect_to controller: "visit", action: "index"
  end
end
