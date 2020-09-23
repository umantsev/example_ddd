# frozen_string_literal: true

require 'json'
require 'sinatra'
require 'sinatra/activerecord'

class ExampleBusinessLogic < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  before do
    content_type 'application/vnd.api+json'
  end

  get '/users/:id' do
    result = Application['users_domain.handlers.show'].call(params[:id])
    Application['users_domain.serializers.monad_serializer'].call(result)
  end
end
