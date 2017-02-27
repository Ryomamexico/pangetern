class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      ContactMailer.received_email(@contact).deliver
      render :thanks, :layout => nil
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
  def thanks
    @contact = Contact.new(params[:contact])    
    render :action => 'Thanks'
  end
end
