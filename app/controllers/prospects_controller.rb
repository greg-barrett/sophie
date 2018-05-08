class ProspectsController < ApplicationController
  def new
    @prospect=Prospect.new
  end

  def create
    @prospect=Prospect.new(prospect_params)
    if @prospect.save
      #@prospect.send_activation_email
      flash[:success] = "Thanks for getting in touch. We will reply as soon."
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
    def prospect_params
      params.require(:prospect).permit(:title, :first_name, :second_name, :email, :phone_number, :message)
    end
  end
