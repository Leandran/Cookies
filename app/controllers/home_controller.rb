class HomeController < ApplicationController
  def set_cookies
    cookies[:username] = "Smith"
    cookies[:customer_number] = "1234567890"
  end

  def show_cookies
    @username = cookies[:username]
    @customer_number = cookies[:customer_number]
  end

  def delete_cookies
    cookies.delete :username
    cookies.delete :customer_number
  end
end
