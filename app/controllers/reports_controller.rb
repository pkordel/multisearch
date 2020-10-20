class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'Reports'
  end
end
