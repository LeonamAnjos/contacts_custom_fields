class ContactCustomFieldsController < ApplicationController
  before_action :set_contact_custom_field, only: [:show, :edit, :update, :destroy]

  def index
    @contact_custom_fields = ContactCustomField.of_user current_user
  end

  def show
  end

  def new
    @contact_custom_field = ContactCustomField.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @contact_custom_field = ContactCustomField.new(contact_custom_field_params)

    respond_to do |format|
      if @contact_custom_field.save
        format.html { redirect_to @contact_custom_field, notice: 'Contact custom field was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact_custom_field.update(contact_custom_field_params)
        format.html { redirect_to @contact_custom_field, notice: 'Contact custom field was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact_custom_field.destroy
    respond_to do |format|
      format.html { redirect_to contact_custom_fields_url, notice: 'Contact custom field was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_custom_field
      @contact_custom_field = ContactCustomField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_custom_field_params
      params.require(:contact_custom_field).permit(:name, :field_type, :user_id)
    end
end
