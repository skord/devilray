class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_manta_account

  def current_manta_account
    if current_user && current_user.manta_accounts.any? {|acct| acct.active?}
      current_user.manta_accounts.where(active: true).first
    end
  end
end
