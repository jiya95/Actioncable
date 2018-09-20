class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  # GET /users/sign_up
  def new
    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_role
    respond_with self.resource
  end

  protected

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [{ role_attributes: :name }])
  end
end
