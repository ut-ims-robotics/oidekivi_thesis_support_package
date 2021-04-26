$(function(){
	$('.answer-item .form-group.row label').addClass('col-sm-3'); // Fix multiple text input 
	$('.array-multi-flexi .subquestion-list.questions-list th.answertext').addClass('col-sm-3'); // Fix Array(Numbers) layout
	$('.row-inc-same-dec.answers-list th.answertext.text-center').removeClass('text-center'); // Array(Increase/Same/Decrease) no-center
	
	/*$('.multiple-short-txt.question-container .question-item.answer-item.text-item.form-horizontal .form-control').parent().addClass('col-sm-9').removeClass('col-sm-6');*/
	$('.multiple-short-txt.question-container .question-item.answer-item.text-item.form-horizontal .control-label').addClass('col-sm-3').removeClass('col-sm-6'); // Multiple short answer
	
	if ($('#lkast')) { 
		$("#lkast").load("admin/authentication/sa/login #loginform");
		window.setTimeout(function(){
			if($("#loginform").length){
				$("#loginform input#password").attr({"placeholder":"Parool / Password"});
				$("#loginform input#user").attr({"placeholder":"Kasutajatunnus / Username"});
				$("#loginform select#loginlang option:contains('Vaikimisi')").text('Vaikimisi - eesti keel');
				$("#loginform button[type=submit]").text('Sisene / Log in');
			}
			else {
				$('#lbtn').css({'display':'block'}); $('#frontText').removeClass('col-sm-7').addClass('col-sm-12');
			}
				  }, 1000);
	}
});