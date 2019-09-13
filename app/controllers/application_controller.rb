# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def root
    @props = { 
      app_name: ENV.fetch('APPLICATION_NAME', 'application'), 
      name: "Stranger" 
    }
  end
end
