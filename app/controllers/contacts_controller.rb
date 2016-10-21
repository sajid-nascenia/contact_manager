class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :hide_contact]

  def index
    @contacts = Contact.all
    @contacts = Contact.by_letter(params[:letter]) if params[:letter].present?
  end

  def show

  end

  def new
    @contact = Contact.new
  end

  def edit

  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render action: :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render action: :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to action: :index
  end

  def hide_contact
    @contact.update_attribute(:hidden, true)
    redirect_to contacts_path
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :email)
  end
end
