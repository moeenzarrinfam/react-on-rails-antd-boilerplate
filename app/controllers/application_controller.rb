# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def root
    # should be render with react
    render json: { message: "Welcome to #{ENV.fetch('APPLICATION_NAME', 'application!')}" }
  end
end
