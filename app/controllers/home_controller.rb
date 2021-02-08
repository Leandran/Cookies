class HomeController < ApplicationController
  before_action :set_breadcrumbs
 
    def set_cookies
    cookies.permanent[:username] = "Smith"       #cookie valid for 20 years
    cookies.permanent[:customer_number] = "1234567890"
  end

  def show_cookies
    @username = cookies[:username]
    @customer_number = cookies[:customer_number]
  end

  def delete_cookies
    cookies.delete :username
    cookies.delete :customer_number
  end

  private
  def set_breadcrumbs
    if session[:breadcrumbs]
      @breadcrumbs = session[:breadcrumbs]
    else
      @breadcrumbs = Array.new
    end

    @breadcrumbs.push(request.url)

    if @breadcrumbs.count > 4
      #shit removes first element
      @breadcrumbs.shift
    end

    session[:breadcrumbs] = @breadcrumbs
  end
end
