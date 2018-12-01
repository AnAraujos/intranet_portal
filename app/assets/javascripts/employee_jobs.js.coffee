# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  selectOption = $('<option value="" selected="selected">Select Employee</option>')
  employee_details = $('#employee_id_select').html()
  $('#asset_id_select').change ->
    asset = $('#asset_id_select :selected').val()
    escaped_asset = asset.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(employee_details).filter("optgroup[label='#{escaped_asset}']").prepend(selectOption).html()
    if options == '<option value="" selected="selected">Select Employee</option>'
      $('#employee_id_select').empty()
      $('select#employee_id_select').append("<option>" + '-- No Employee -- ' + "</option>")
      $('#employee_id_select').parent().show()
      $('#employee_id_select').prop("disabled", true)
      $('#addbtn').prop("disabled", true)
    else
      $('#employee_id_select').html(options)
      $('#employee_id_select').parent().show()
      $('#employee_id_select').prop("disabled", false)
      $('#addbtn').prop("disabled", false)

