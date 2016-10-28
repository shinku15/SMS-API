class HistoryController < ApplicationController
  before_filter :authenticate_user!

  def index
    @histories = History.all.order(created_at: :desc)
  end
end
