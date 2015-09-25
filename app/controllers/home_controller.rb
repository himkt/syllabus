class HomeController < ApplicationController
  def index
    @record_size = Subject.all.size
  end
end
