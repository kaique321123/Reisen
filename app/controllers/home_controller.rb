class HomeController < ApplicationController
  def index
    @notices = Notice.visible.order(created_at: :desc)
  end
end
