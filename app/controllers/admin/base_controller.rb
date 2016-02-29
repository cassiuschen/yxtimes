class Admin::BaseController < ApplicationController
	layout 'layouts/admin'
	before_action :sign_in_as_admin?

	private
  def sign_in_as_admin?
    unless current_user && current_user.try(:admin?)
      redirect_to new_user_session_path
    end
  end
end