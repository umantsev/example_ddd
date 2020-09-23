# frozen_string_literal: true

require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require './example_business_logic.rb'
  end
end
