# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  selectOption = $('<option value="" selected="selected">Select a SubStore</option>')
  sub_stores = $('#sub_store_id_select').html()
  $('#store_id_select').change ->
    store = $('#store_id_select :selected').val()
    escaped_store = store.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options =  $(sub_stores).filter("optgroup[label='#{escaped_store}']").prepend(selectOption).html()
    if options == '<option value="" selected="selected">Select a SubStore</option>'
      $('#sub_store_id_select').empty()
      $('select#sub_store_id_select').append("<option>" + '-- No SubStore -- ' + "</option>")
      $('#sub_store_id_select').parent().show()
      $('#sub_store_id_select').prop("disabled", true)
    else
      $('#sub_store_id_select').html(options)
      $('#sub_store_id_select').parent().show()
      $('#sub_store_id_select').prop("disabled", false)
      