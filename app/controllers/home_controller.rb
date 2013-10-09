class HomeController < ApplicationController
  def index
  end

  def create
    lead = Lead.find_or_create_by(email: params[:email])

    if lead.save
      redirect_to :root
      flash[:notice] = "Your email has been registered."
    else
      redirect_to :root
      flash[:alert] = "Your email was not registered. Please try again."
    end
  end
end