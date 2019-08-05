class ContactsController < ApplicationController
  before_action :load_object, only: [:show, :edit, :destroy, :update]
  before_action :check_current_user

  def index
    @contacts = Contact.all
    @contacts_counte = Contact.all.count
  end

  def new
    @contact = Contact.new
  end

  def update
    @contact.update(contact_params)
    redirect_to contact_params
  end

  def create
    @contact = Contact.create(contact_params)
    redirect_to contacts_path
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  def show; end

  def edit; end

  def contact_params
    params.require(:contact).permit(:user_id, :title, :body)
  end

  def load_object
    @contact = Contact.where(id: params[:id]).first
  end

  def check_current_user
    redirect_to root_path unless current_user
  end
end
