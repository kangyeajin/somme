$(function() {
    $("button").click(function () {
          $(wineSelect_start).css('display', 'none');
          $(Q1).css('display', 'none');
          $(Q2).css('display', 'none');
          $(Q3).css('display', 'none');
          $(Q4).css('display', 'none');
          $(Q5).css('display', 'none');
          $(Q6).css('display', 'none');
    });
    
    $("#wineSelect_start button").click(function () {
        $(Q1).css('display', 'block');
    });
    $("#Q1 button").click(function () {
        $(Q2).css('display', 'block');
    });
    $("#Q2 button").click(function () {
        $(Q3).css('display', 'block');
    });
    $("#Q3 button").click(function () {
        $(Q4).css('display', 'block');
    });
    $("#Q4 button").click(function () {
        $(Q5).css('display', 'block');
    });
    $("#Q5 button").click(function () {
        $(Q6).css('display', 'block');
    });
});

var sum ="";

$(document).ready(function(){
   $("button[type='button']").on("click",function(e){
      sum += $(this).val();
      $(this).innerText = sum;
   });
   
   var resultForm =$("#resultForm");
   $("button[type='submit']").on("click",function(e){
      e.preventDefault();
      resultForm.append("<input type='hidden' name='resultno' value='"+sum+"'>");
      resultForm.submit();
   });
});