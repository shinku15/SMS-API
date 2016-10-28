class MobilesController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def create

  end

  def new

  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def import
      @errors = []
      if params[:message].present?

          if params[:file].present? || params[:number].present?

            if params[:file].present?
              Mobile.import(params[:file],params[:message])
              @success = true
            else
              @errors << "Error in file"
              @success = false
            end

            if params[:number].present?
              contacts = params[:number].split(",")
                  contacts.uniq.each do |contact|
                      if contact.length == 10 && /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/.match(contact)
                        SendJob.perform_later(contact, params[:message])
                        @success = true
                      else
                        @errors << "Number is less than 10 digits"
                        @success = false
                      end
                  end
            end

          else
              @errors <<" Upload a file or provide a contact"
              @success = false
          end

      else
        @errors << "Message is blank"
        @errors << "Upload a file or provide a contact"  unless params[:file].present? || params[:number].present?
        @success = false
      end
  end

end
