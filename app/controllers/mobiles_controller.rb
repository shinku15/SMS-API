class MobilesController < ApplicationController
  def index
    @mobiles = Mobile.all
  end

  def create
    contacts = params[:mobile][:number].split(",")
    @mobiles = []
    contacts.each do |contact|
      @mobile = Mobile.new(number: contact, message: params[:mobile][:message])
      @mobile.save
      @mobile.send_message
      @mobiles << @mobile
    end
  end

  def new
    @mobile = Mobile.new()
  end

  def show
    @mobile = Mobile.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def mobile_params
      params.require(:mobile).permit(:number,:message)
  end
end
