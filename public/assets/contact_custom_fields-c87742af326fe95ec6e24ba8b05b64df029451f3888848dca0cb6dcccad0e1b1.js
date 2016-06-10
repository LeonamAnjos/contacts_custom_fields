(function() {
  jQuery(function() {
    this.bah = function(option) {
      $("#combobox_options_group").css("visibility", "hidden");
      if (option === "combo_box") {
        return $("#combobox_options_group").css("visibility", "visible");
      }
    };
    return this.bah($("#contact_custom_field_field_type").find(":selected").val());
  });

}).call(this);
