class TestController < ApplicationController
  def index
  end

  def show
    Redis.current.set('mykey', 'Hello')
  end
end
