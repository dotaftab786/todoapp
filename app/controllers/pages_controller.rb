class PagesController < ApplicationController
  def hello
    render plain: "hello pages"
  end
end