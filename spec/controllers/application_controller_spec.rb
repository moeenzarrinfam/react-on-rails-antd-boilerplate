# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'GET #root' do
    it 'returns a success response' do
      get :root
      expect(response).to have_http_status(:success)
    end
  end
end
