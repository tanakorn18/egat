var OilContamination = {};

OilContamination.setupTransformerNameComboxBox = function(id) {
  if ($('#' + id).length > 0) {
    var transformerId;
    var selected;
    if (jQuery.url.attr("path").split("/")[1] == "transformers" && 
      Number(jQuery.url.attr("path").split("/")[2]) > 0) {
      transformerId = Number(jQuery.url.attr("path").split("/")[2]);
    }
    selected = $("#" + id + " " + "option:selected");
    if (selected.val().length > 0) {
      transformerId = selected.val();
    }
    var converted = new Ext.form.ComboBox({
        typeAhead: true,
        triggerAction: 'all',
        transform: id, 
        width: '200',
        forceSelection:true,
        value: transformerId
    });

    converted.on('select', function() {
        OilContamination.onTransformerNamChange(converted.getValue());    
    });
  }
};

OilContamination.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + 
                           "/oil_contaminations/new";
  }
};


$(document).ready(function(){
    $('#oil_contamination_test_date').datepicker({
        dateFormat: 'dd/mm/yy',
        buttonImage: "images/icon_calendar.gif"
    });

    OilContamination.setupTransformerNameComboxBox("oil_contamination_transformer_id");
});

