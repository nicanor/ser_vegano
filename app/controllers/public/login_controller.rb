class Public::LoginController < Public::PublicController

  def submit
    @user = User.new permitted_params

    login @user.email, @user.password

    if logged_in?
      redirect_to admin_root_path, success: t(:logged_in)
    else
      flash[:warning] = t(:invalid_credentials)
      render 'log_in'
    end
  end

  def log_in
    @user = User.new
  end

  def log_out
    logout
    redirect_to login_path, success: t(:logged_out)
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password)
  end

end