class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit


  # pundit white-list approach
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :authenticate_user!
  include Pundit

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # def default_url_options
  #   { host: ENV["HOST"] || "localhost:3000" }
  # end
end
