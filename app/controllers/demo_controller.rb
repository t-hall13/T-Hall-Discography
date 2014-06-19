class DemoController < ApplicationController
  layout  'application'

  before_action :confirm_logged_in
  
  def index	
  	
  end

  def hello
  	  # render("index")
      @array = ["Larry","Curly", "Moe"]
      @id = params['id'].to_i
      @page = params[:page].to_i
  end
  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end
  def wiki
    redirect_to("http://server.t-hall13.com")
  end
  def text_helpers
  end

  def escape_output
  end
end
