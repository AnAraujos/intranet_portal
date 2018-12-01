$(document).ready(function(){
    var array = Array();
    $('#div_job_end').hide();
  $(document).on('change','#asset_id_select', function () {
   load_employeers_from_asset_dropdown();
  });

  function load_employeers_from_asset_dropdown(){
      var request = "available_employers?employee_asset_id=" //access controller of interest
          + $('#asset_id_select').val() + "&job_id="+ $('#job_id').val();

      var aj = Rails.ajax({
          url: request,
          type: 'get',
          data: $(this).serialize(),
                  success: function(data) {
                      change_employers(data);
                  },
                  error: function(e) {
                      console.log(e.message);
                  }
   
   
      });
  };

  function change_employers(data) { 
  	if(data && data ==""){
  	  $("#employee_id_select").empty();
      $('select#employee_id_select').append("<option>" + '-- No Employee -- ' + "</option>")
      $('#employee_id_select').prop("disabled", true)
      $('#addbtn').prop("disabled", true)
    }
    else {
      $("#employee_id_select").empty();
      $('select#employee_id_select').prepend("<option>" + 'Select Employee' + "</option>")
      $('#employee_id_select').prop("disabled", false)
      $('#addbtn').prop("disabled", false)
  	  for(i = 0;i<data.length;i++){ 
  	        $("#employee_id_select").append(
  	            $("<option></option>").attr("value", data[i].id).text(data[i].name + " " + data[i].surname)
  	        );
  	    }
  	}
  };


  $(document).on('click','#btnsave', function () {
   var id_status =  $('#select_situation_id').val();
   var job = (this.getAttribute("data-job"));
    var request = "save?id_status=" 
      +id_status+ "&job_id="+ job

      var aj = Rails.ajax({
        url: request,
        type: 'get',
        data: $(this).serialize(),
                success: function(data) {
                  alert("Job Situation has changed!");
                  window.location.href = "/home";
                 },
                error: function(e) {
                  console.log(e.message);
                } 
      });
  });

  $('#addbtn').click(function(){
    var newitem = $('#employee_id_select').val();
    if (newitem && newitem =="Select Employee") {
      alert("Select an Employee.");
      return
    }
    if($.inArray(newitem,array) >= 0) {
      alert("Employee is already on the list.");
    } else {
      employee_name_asset = $('#employee_id_select :selected').text()+" - "+ $('#asset_id_select :selected').text()
      $('#list').append('<li id="'+newitem+'" class="list-group-item"><input type="button" data-id="'+newitem+'" class="listelement" value="X" /> '+employee_name_asset+'<input type="hidden" name="listed[]" value="'+newitem+'"></li>');
        array.push(newitem)
      $('#input_hidden_field_arr').val(JSON.stringify(array));
      $('#employee_id_select').val('Select Employee');
      return false; 
     }
   });
    
    $('#list').delegate(".listelement", "click", function() {
    var elemid = $(this).attr('data-id');
    $("#"+elemid).remove();
    var index = array.indexOf(elemid);
      if (index > -1) {
        array.splice(index, 1);
      }
   
    });
    $('#btnSend').click(function(){
     if (array && array =="") {
      alert("Select an Employee.");
      return false;
      }
    });   

      $(document).on('change','#job_situation_select', function () {
      situation_job = $('#job_situation_select').val();
      if (situation_job == '2') {
        $('#div_job_end').show();
        $('.dt_end').prop("required", true)
        $('.end_time').prop("required", true)
        $('.job_end').prop("required", true)
        $('.store_end').prop("required", true)
      }else{
        $('#div_job_end').hide();
        $('.dt_end').prop("required", false)
        $('.dt_end').val('').text;
        $('.end_time').prop("required", false)
        $('.end_time').val('').text;
        $('.job_end').prop("required", false)
        $('.job_end').val('').text;
        $('.store_end').prop("required", false)
        $('.store_end').val('').text;        
      }
  });
});
    
