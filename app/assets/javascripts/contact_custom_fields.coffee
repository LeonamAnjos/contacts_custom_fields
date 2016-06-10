# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    @setComboBoxOptionsVisibility = (option) ->
        $("#combobox_options_group").css("visibility", "hidden")
        $("#combobox_options_group").css("visibility", "visible") if option is "combo_box"
    
    @setComboBoxOptionsVisibility($("#contact_custom_field_field_type").find(":selected").val())
    