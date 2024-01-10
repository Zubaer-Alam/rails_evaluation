class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    super
    resource.generate_api_key if resource.persisted?
  end
end
