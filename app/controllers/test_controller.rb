class TestController < ApplicationController
  def test
    @user = current_user
  end
end
