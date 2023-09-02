class ApplicationController < ActionController::API
  include Authentication

  before_action { request.format = 'json' }

  private

  attr_reader :permitted_params

  def permit_params!(*args)
    @permitted_params = params.permit(*args).slice!(*args)
  end

  def respond_with_error(error, status = 400)
    render json: { status: error }, status:
  end

  def respond_with_success(data, status = 200)
    render json: { status: data }, status: status
  end
end
