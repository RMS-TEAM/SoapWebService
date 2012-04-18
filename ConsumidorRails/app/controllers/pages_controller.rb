class PagesController < ApplicationController
  def home
  end

  def about
    @title = "Acerca de"
  end
end
