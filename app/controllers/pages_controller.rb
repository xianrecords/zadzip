class PagesController < ApplicationController
  
  before_filter :authenticate
  
  def home
        @title = "Home"
  end

  def advertise
        @title = "Advertise"
  end

  def display
        @title = "Display"
  end

  def store
        @title = "Store"
  end

end
