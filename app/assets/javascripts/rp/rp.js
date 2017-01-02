$(document).ready(function(){
  $("#setting_scheme").on("change",function(){
    var scheme =  $(this).val();
    if (scheme == 'file'){
      $('#setting_host').val('');
      $('#setting_host').prop('readOnly',true);
      $('#setting_username').val('');
      $('#setting_username').prop('readOnly',true);
      $('#setting_password').val('');
      $('#setting_password').prop('readOnly',true);
    }
    else{
      $('#setting_host').prop('readOnly',false);
      $('#setting_username').prop('readOnly',false);
      $('#setting_password').prop('readOnly',false);
    }
  });

  if ($('#setting_scheme').val() == 'file'){
    $('#setting_host').val('');
    $('#setting_host').prop('readOnly',true);
    $('#setting_username').val('');
    $('#setting_username').prop('readOnly',true);
    $('#setting_password').val('');
    $('#setting_password').prop('readOnly',true);
  }
  else{
    $('#setting_host').prop('readOnly',false);
    $('#setting_username').prop('readOnly',false);
    $('#setting_password').prop('readOnly',false);
  }
});