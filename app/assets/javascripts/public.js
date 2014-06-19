// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
= require public
//= require demo

$(document).ready(function(){
	// alert($('h4').length);
 $("#navigation ul li ul").accordion({collapsible:false, heightStyle:"content"});
   // $("li").click(function(){
   //   $(this).switchClass("task","taskClicked",'fast',"easeInOutQuad");
   });
   // $(function(){
   //     $("#datepicker").datepicker({buttonText:"Date"});
   //     dateVariable = $('#datepicker').val();
       
   //     });
      
// });