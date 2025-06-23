# frozen_string_literal: true

class API < Grape::API
  format :json

  prefix 'api'

  namespace :domains do
    mount Domains::API
  end

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    rack_response({
      status: e.status,
      error_msg: e.message
    }.to_json, 400)
  end
end
