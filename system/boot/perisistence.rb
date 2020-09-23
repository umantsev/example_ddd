# frozen_string_literal: true

Application.boot(:persistence) do |container|
  start do
    require 'sequel'

    connect_params = {
      adapter: 'postgres',
      host: ENV['POSTGRES_HOST'],
      database: ENV['POSTGRES_DB'],
      user: ENV['POSTGRES_USER'],
      password: ENV['POSTGRES_PASSWORD']
    }

    container.register('persistence.db', Sequel.connect(connect_params))
  end

  stop do
    db.disconnect
  end
end
