_last_event_obj = null; // branch: 지점(branch)  car: 차량,  time: 시간

var hasCheckCar = false;
var hasNext = false;
var hasCDVal = 0;
var currentDate = new Date();
var current_year = currentDate.getFullYear();			//현재 연도
var current_month = currentDate.getMonth() + 1;		//현재 월
var current_day = currentDate.getDate();				//현재 일
var current_date = current_year + "" + addZero(current_month) + "" + addZero(current_day);
var s_hour = currentDate.getHours();//현재 시간
var s_min = currentDate.getMinutes();//현재 분

var jejuStartHour = "06"; 				// 제주 예약 및 반납  시작시간
var jejuStartHourNumber = 6; 		// 제주 예약 및 반납  시작시간
var jejuResEndHour = "22"; 			// 제주 예약 종료시간
var jejuResEndHourNumber = 22; 	// 제주 예약 종료시간
var jejuRtnEndHour = "22"; 			// 제주 반납 종료시간
var jejuRtnEndHourNumber = 22; 	// 제주 반납 종료시간
var jejuTodayStartHour = "08";			// 제주 현재일 예약 시작시간
var jejuTodayStartHourNumber = 8;	// 제주 현재일 예약 시작시간

var inlandStartHour = 9; //내륙 예약 및 반납 시작시간
var inlandEndHour = 19; //내륙 예약 및 반납 종료시간

var today = new Date();

var today_yyyy = today.getFullYear();
var today_mm = today.getMonth()+1;
var today_dd = today.getDate();

today_dd = addZero(today_dd);
today_mm = addZero(today_mm);

var today_date = today_yyyy +""+ today_mm +""+ today_dd;
if(s_min > 30){
	s_hour += 4;
	s_min = 0;
}else if(s_min == 0){
	s_hour += 3;
	s_min = 0;
}else{
	s_hour += 3;
	s_min = 30;
}
var shourFlag;
var sMinFlag;
var gChekInlandSHour = "09";
var gChekInlandSMin = "00";
var gChekInlandLHour = "19";
var gChekInlandLMin = "00";

$(window).load(function(){
	
	// window.load 이벤트에서 호출해야함. ready에서 하면 안됨
	/// 단기메인에서 차종을 선택했을때는 처음 한번은 선택한 차종탭으로 변경해준다
	var carTab = $("#params_carTab").val(); // 단기메인에서 선택한 차종(1~6: 탭번호)	
	if (carTab != "")
	{
		$("#alert-cartype li.c" + carTab + " a" ).trigger('click');
	}
});

$(function(){
	$(document).ajaxStart(
					function(){
						$.blockUI({             
									message: $('#sht_rnt_loading'), 
									css: { background : 'none', border: 'none'	 } 
								})
						}
				); 
	$(document).ajaxStop($.unblockUI);	
	
	$(".onlyNumber").keyup(function(event) { 
	    var exgexp = /[^0-9]/g;
		var v = $(this).val();
		if( exgexp.test(v)) {
			$(this).val(v.replace(exgexp,''));
		};
	});
	
	$(".onlyKor").keyup(function(event){
		var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		var v = $(this).val();
		if( regexp.test(v) ) {
			$(this).val(v.replace(regexp,''));
		}
	 });
	$(".onlyKorEng").keyup(function(event){
		var exgexp = /[^(ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z)]/gi;
		var v = $(this).val();
		if( exgexp.test(v)) {
			$(this).val(v.replace(exgexp,''));
		};
	 });
	/* 
	$(".onlyKorEng").keyup(function(event){
		var regexp = /[0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		var v = $(this).val();
		if( regexp.test(v) ) {
			$(this).val(v.replace(regexp,''));
		}
	 });
	*/
	$(".onlyKorNumber").keyup(function(event){
		var regexp = /[a-z]|[ \[\]{}()<>?|`~!@#$%^&\*\-\_+=,.;:\"'\\]/g;
		var v = $(this).val();
		if( regexp.test(v) ) {
			$(this).val(v.replace(regexp,''));
		}
	 });
	$(".checkEmail").keyup(function(event){
		var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		var v = $(this).val();
		if( !regexp.test(v) ) {
			$(this).val('');
		}
	 });

	$(".event_pop_close, .dimd-new").click(function(){
		$(".event_all").hide();                    		
	});     
});


function shtEvnt(evntSeqNo){
	$.ajax({
		type : "post",
		url : "/rent/rentcar/getShtEvntDetail.json",
		data : {
			'evntSeqNo' :evntSeqNo
			},
		dataType : "json",
		success : function(data) {
			
    		$(".event_all").show();
    		$(".article-content-head").html("<img src='/rent/imageviewer.do?GBN=evntSht&SQ="+evntSeqNo+"' alt='이벤트 이미지'>");
    		eventChange(evntSeqNo);
		}
	});
}

// 이벤트 수정
function eventChange(seqNo){
	// SK렌터카 통합 기념 제주 최대 85% 할인 이벤트
	if(seqNo == "10250"){
		$(".article-content-head").html("<a href='#' onclick='copyCpn();'><img src='/rent/imageviewer.do?GBN=evntSht&SQ="+seqNo+"' alt='이벤트 이미지'></a>");
	}
}

// 이벤트 쿠폰번호 복사
function copyCpn(){
	var copyText = "SG10048988";
	var aux = document.createElement("input");
	aux.setAttribute("value", copyText );
	document.body.appendChild(aux);
	aux.select();
	document.execCommand("copy");
	document.body.removeChild(aux);
	alert("복사되었습니다.");
}
 
function setShortParams(){//단기 메인에서 받아온 변수 셋팅
	console.log("setShortParams 접근");
	var pSDate = $("#params_sDate").val();
	var menu = $("#reservMenu .selected").text();
	var todayStartHour = ($.trim(menu) == "제주예약")  ? jejuTodayStartHourNumber:12;
	var startHour = ($.trim(menu) == "제주예약")  ? jejuStartHourNumber:inlandStartHour;
	var endHour = ($.trim(menu) == "제주예약")  ? jejuResEndHourNumber:inlandEndHour;
	var startLHour = ($.trim(menu) == "제주예약")  ? jejuStartHourNumber:inlandStartHour;
	var endLHour = ($.trim(menu) == "제주예약")  ? jejuResEndHourNumber:inlandEndHour;
	var str="";
	var str2="";
	
	$("#sHour,#lHour,#sMinute,#lMinute").prop("disabled", false);

	var pLDate = $("#params_lDate").val();
	var pSHour = $("#params_sHour").val();
	var pLHour = $("#params_lHour").val();
	var pSMinute = $("#params_sMinute").val();
	var pLMinute = $("#params_lMinute").val();
	
	var pCdId = $("#params_cdId").val();
	var pBranchId = $("#params_branchId").val();
	var pBranchId2 = $("#params_branchId2").val();
	
	var Cyear = currentDate.getFullYear();
	var Cmonth = addZero(currentDate.getMonth()+1);
	var Cday = addZero(currentDate.getDate());
	var Tday = addZero(currentDate.getDate()+1);
	var Cdate = Cyear + "-" + Cmonth + "-" + Cday;
	var tomorrowDate = Cyear + "-" + Cmonth + "-" + Tday;
	
	var possSHour=s_hour;
	var possMin=s_min;
	var possEHour=parseInt(endHour);
	var possLEHour=parseInt(endHour);
	
	//console.log("SSSSSSSSS1 : ", pSDate);
	
	//단기메인 시간, 퍼블셋팅
	if(pSDate == Cdate){//당일
		if(($.trim(menu) == "내륙예약" && s_hour < 12 || (s_hour == 12 && s_min == 0)) ||
			($.trim(menu) == "제주예약" && s_hour < jejuTodayStartHourNumber || (s_hour == jejuTodayStartHourNumber && s_min == 0))){
			for(var i=todayStartHour; i<=endHour;i++){		//예약가능시간 셋팅
				if(startHour <= i){
					if(i == pSHour) str+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
					else str+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
				}
			}
		}else{
			for(var i=s_hour; i<=endHour;i++){		//예약가능시간 셋팅
				if(startHour <= i){
					if(i == pSHour) str+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
					else str+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
				}
			}
		}
		
		console.log("DDDDDDDDDDDDDDD ---------------0 : " + startLHour);
		console.log("DDDDDDDDDDDDDDD ---------------0 : " + possLEHour);
		
		for(var i=startLHour; i<=possLEHour; i++){
			if( $.trim(menu) == "제주예약" && lDate == closedEndDate && (closedEndTime.substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
			
			str2 += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		}
	}else{// 당일이 아닐경우 셋팅
		if(pSDate == tomorrowDate){
			if($.trim(menu) == "제주예약"){
				if(s_hour == jejuResEndHourNumber && s_min == 30){	//18시 넘어갈때 차일 8시로 셋팅
					possSHour = jejuStartHourNumber;
					possMin = 30;
				}else if(s_hour > jejuResEndHourNumber && s_hour < 24){	//19, 20, 21시 일때
					possSHour = s_hour - 16;
				}else if(s_hour > 23){
					possSHour = todayStartHour;
					possMin = 0;
				}else{
					possSHour = startHour;
				}
			}else{
				if(s_hour == 19 && s_min == 30){	//16시 넘어갈때 차일 9시로 셋팅
					possSHour = 9;
					possMin = 30;
				}else if(s_hour > 19 && s_hour < 22){	//17, 18, 19시 일때
					possSHour = s_hour - 10;
				}else if(s_hour > 21){ 
					possSHour = todayStartHour;
					possMin = 0;
				}else{
					possSHour = startHour;
				}
			}
			shourFlag = possSHour;
			sMinFlag = possMin;
			for(var i=possSHour; i<=endHour;i++){		//예약가능시간 셋팅
				if(startHour <= i){
					if( $.trim(menu) == "내륙예약" && dateFormat($("#sDate").val(),'',0) == closedStartDate[i] && (closedStartTime[i].substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
					
					if(i == pSHour) str+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
					else str+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
				}
			}
			
		}else{
			if(pSDate == "2020-07-31" &&  $.trim(menu) == "제주예약"){
				endHour = 21;
			}
			if(pSDate == "2020-08-01" &&  $.trim(menu) == "제주예약"){
				startHour = 8;
			}
			
			for(var i=startHour; i<=endHour;i++){
				if( $.trim(menu) == "내륙예약" && dateFormat($("#sDate").val(),'',0) == closedStartDate[i] && (closedStartTime[i].substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
				
				if(i == pSHour) str+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
				else str+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
			}
			
			if(pLDate == "2020-07-31" &&  $.trim(menu) == "제주예약"){
				possLEHour = 21;
			}
			if(pLDate == "2020-08-01" &&  $.trim(menu) == "제주예약"){
				startLHour = 8;
			}
			
			for(var i=startLHour; i<=possLEHour; i++){
				if( $.trim(menu) == "제주예약" && lDate == closedEndDate && (closedEndTime.substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
				
				str2 += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
			}
		}
	}
	$("#sHour").html(str);
	$("#lHour").html(str2);
	
	if(pLHour != null){
		$('#lHour option[value="'+addZero(pLHour)+'"]').prop('selected',true);
	}
	
	//20171228 대여가능시간 변경  //수정
	//20200207 대여가능시간 변경  //수정	
	if(pBranchId=="000012"){
		if(pSHour == jejuResEndHour) {
			pSMinute = "00";
			$("#sMinute").prop("disabled", true);
		}else{
			$("#sMinute").prop("disabled", false);
		}
		if(pLHour == jejuRtnEndHour) {
			pLMinute = "00";
			$("#lMinute").prop("disabled", true);
		}else{
			$("#lMinute").prop("disabled", false);
		}
	}
//	else{
//		if(pSHour == '19') {
//			pSMinute = "00";
//			$("#sMinute").prop("disabled", true);
//		}else{
//			$("#sMinute").prop("disabled", false);
//		}
//		if(pLHour == '19') {
//			pLMinute = "00";
//			$("#lMinute").prop("disabled", true);
//		}else{
//			$("#lMinute").prop("disabled", false);
//		}
//	}
	
	$("#sMinute").val(pSMinute);
	$("#lMinute").val(pLMinute).trigger('change');
	
	if(pSDate == "2020-07-31" &&  $.trim(menu) == "제주예약" && pSHour == "21"){
		$("#sMinute").val("00");
		setTimeout(function(){
			$("#sMinute").prop("disabled", true);
		});
	}
	if(pLDate == "2020-07-31" &&  $.trim(menu) == "제주예약" && pLHour == "21"){
		$("#lMinute").val("00");
		setTimeout(function(){
			$("#lMinute").prop("disabled", true);
		});
	}
	

	var str_sDate = pSDate + " " + pSHour + "시 " + pSMinute + "분";
	var str_lDate = pLDate + " " + pLHour + "시 " + pLMinute + "분";
	
	$("#s_date_end").html(str_sDate);
	$("#e_date_end").html(str_lDate);
	
	var sDate = dateFormat($("#params_sDate").val(),'',0);
	var lDate = dateFormat($("#params_lDate").val(),'',0);
	
	var TMP_SDATE = sDate + pSHour + pSMinute;
	var SDATE = TMP_SDATE.length==12?TMP_SDATE:"";
	
	var TMP_LDATE = lDate + pLHour + pLMinute;
	var LDATE = TMP_LDATE.length==12?TMP_LDATE:"";
	
	var sHourMinute = pSHour + pSMinute;
	var lHourMinute = pLHour + pLMinute;
	
	calendar._selectFromDate = pSDate;
	calendar._selectToDate = pLDate;
	calendar._clickCount = 2;
	
	calcTotalTime(); //전체 대여 기간 계산
	
		var gubun = "sDate";
		var menu = $("#reservMenu .selected").text();
		var endHour = ($.trim(menu) == "제주예약")  ? jejuResEndHourNumber:19;

		setTime(pSHour,pSMinute,pLMinute,endHour, gubun);//선택한 시간, 대여가능 시작 분, 대여 가능 끝 분, 지점 끝 시간, 구분

	return;

	if(pSDate != "" && pBranchId != "000012"){//날짜-시간-분 값이 있을 때
		$.ajax({
			type : "post",
			url : "/rent/rentcar/getBranch.json",
			data : {
				'cdId'  : pCdId
			   ,'model' : ''
			   ,'sDate' : SDATE
			   ,'lDate' : LDATE
				},
			dataType : "json",
			success : function(data) {
				var list = data.areaList;
				
				var options = "<option value=\"\">지점선택</option>"; //지역에 따른 대여지점 옵션
				var options2 = "<option value=\"\">지점선택</option>"; //지역에 따른 반납지점 옵션
				for(var i = 0; i < list.length; i++){
					var isDisable = false;
					var isDisable2 = false;
					if(parseInt(list[i].rsvPsblCnt)==0 || (parseInt(sHourMinute) < parseInt(list[i].sStHhMi )) 
							||(parseInt(sHourMinute) > parseInt(list[i].sEndHhMi)) )
					{//대여 가능한 차량이 없거나 대여시간이 지점 오픈시간보다 이르거나 지점 종료시간보다 늦을 경우 	
						isDisable = true;
					}
					if((parseInt(lHourMinute) < parseInt(list[i].lStHhMi )) || (parseInt(lHourMinute) > parseInt(list[i].lEndHhMi)))
					{//반납시간이 지점 오픈시간보다 이르거나 지점 종료시간보다 늦을 경우
						isDisable2 = true;
					}
					
					options += makeOption2(list[i].branchNm,list[i].branchId,isDisable, pBranchId)+"\n"; //대여 지점 옵션 생성
					options2 += makeOption2(list[i].branchNm,list[i].branchId,isDisable2, pBranchId2)+"\n"; //반납 지점 옵션 생성
				}
				
				if(pCdId != ''){//반납 지역 셋팅 및 비활성화
					if(list.length > 0){
						$('#cdId2').prop('disabled', true);
						//지점 셋팅
						$('#branchId').html(options);
						$('#branchId2').html(options2);
						$('#branchId').prop("disabled", false);
						$('#branchId2').prop("disabled", false);
console.log("from DB DATA");						
console.log("minSStHhMi="+list[0].minSStHhMi);						
console.log("maxSEndHhMi="+list[0].maxSEndHhMi);
console.log("minLStHhMi="+list[0].minLStHhMi);						
console.log("maxLEndHhMi="+list[0].maxLEndHhMi);
console.log("from jsp");
console.log("sHourMinute="+sHourMinute);
console.log("lHourMinute="+lHourMinute);						
							
						if(parseInt(list[0].minSStHhMi)>parseInt(sHourMinute)||parseInt(list[0].maxSEndHhMi)<parseInt(sHourMinute))
						{
							alert('선택하신 지역은 '+list[0].tMinSStHhMi+' ~ '+list[0].tMaxSEndHhMi+'까지 예약 가능합니다.');
						}
						if(parseInt(list[0].minLStHhMi)>parseInt(lHourMinute)||parseInt(list[0].maxLEndHhMi)<parseInt(lHourMinute))
						{
							alert('선택하신 지역은 '+list[0].tMinLStHhMi+' ~ '+list[0].tMaxLEndHhMi+'까지 반납 가능합니다.');
						}
					}
				}
			},
			error : function(){
				alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
			} 
		});
	}
}

function dsBox(id,option){	
console.log("option="+option);	
	$('#'+id+' option').removeAttr('selected');
	$('#'+id+' option[value="'+addZero(option)+'"]').prop('selected',true);
	
	// 셀렉트 박스에 선택된 값과 보여지는 값이 달라 보여지는 경우
	if(id == "lHour"){
		$('#select2-lHour-container').text( addZero(option) + "시" );
	}
	
	if(id == "sHour"){
		$('#select2-sHour-container').text( addZero(option) + "시" );
	}
}

function addZero(v){
	return parseInt(v)<10?"0"+""+parseInt(v):v;
}

var disabled_date;

function alertMsg(name){
	
	console.log("_last_event_obj, name", _last_event_obj, name);
	
	if (_last_event_obj || name != 'time')
	{
		name = _last_event_obj;
	}
	
	switch(name){
	case "branch":
		alert('선택하신 지점은 예약이 완료되어 예약이 불가능 합니다.');
		
		// 지역초기화
		$("#cdId").val(''); 
		$("#cdId2").val(''); 
		// 지점초기화
		$('#branchId').val('');
		$('#branchId2').val('');
		// multiple-select-box 초기화
		
		$('dl.location a.is-selected').removeClass('is-selected');
		$('dl.store dd').remove();
		$("div.rent-store-select span.multiple-select-box strong").text("지역/지점선택");
		
		ldwAbleCheck();
		console.log("-------------------------1");
		getCar();
		getPayment();
		return false;
		break;
	case "time" :
		$('#sDate').val('');
		$('#lDate').val('');
		dsBox("sHour", "");
		dsBox("lHour", "");
		dsBox("sMinute", "");
		dsBox("lMinute", "");
		$('#s_date_end').html('');
		$('#e_date_end').html('');
		alert('선택하신 일자/시간은 예약이 완료되어 예약이 불가능 합니다.');
		return false;
		break;
	case "car" :
		$('#carTypeName').val('');
		$('#orgnCartype').val('');
		$('#modelNm').html('');		
		alert('선택하신 차량은 예약이 완료되어 예약이 불가능 합니다.');
		ldwAbleCheck();
		getPayment();
		return false;
		break;
	default:
		break;
	}
}

var sls_branch = [];

function getSlsBranchCd(branchId){
	var sls = '';
	for(var i = 0; i<sls_branch.length; i++){
		if(sls_branch[i].split(":")[0]==branchId){
			sls = sls_branch[i].split(":")[1]; 
		}
	}
	return sls==''?branchId:sls;
}

function checkAlert(){ //대여일, 반납일, 지점 선택에 따라 대여가능여부 판단 후 alert 띄우기
	var sDate = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	var lDate = "";
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	var TMP_SDATE = sDate+""+$('#sHour').val()+$('#sMinute').val();
	var SDATE = TMP_SDATE.length==12?TMP_SDATE:"";
	var TMP_LDATE = lDate+""+$('#lHour').val()+$('#lMinute').val();
	var LDATE = TMP_LDATE.length==12?TMP_LDATE:"";
	
	var branch = $('#branchId').val();
	var branch2 = $('#branchId2').val();
	
	var menu = $("#reservMenu .selected").text();
	var startHour;
	if($.trim(menu) == "내륙예약") startHour = 9;	//20171228 대여가능시간 변경
	else if($.trim(menu) == "제주예약") startHour = jejuStartHourNumber;
	
	// 2016.09.01 이후 제주 지점 대여/반납은 8:00~20:00까지 ---->시간을 가져올때 제주도의 경우 8:00부터 20:00만 가져오도록 스크립트 수정함
	// 2016.05.01 이후 제주 켄싱턴호텔 중문점 영업종료 ----->DB에서 가져올 때 중문점은 가져오지 않도록 수정함
	// 2017.04.01 이후 부산역 지점 영업종료 ------>DB에서 가져올 때 부산역 지점은 가져오지 않도록 쿼리 수정함	
	// 2017.01.28 설날당일 예약 불가 ------->달력에서 지난 날짜는 선택할 수 없음
}

function dateFormat(obj, type, differ){
	//obj는 $("#sDate").val() 혹은 $("#lDate").val()
	var day;
	if(obj == null || obj == ""){
		day = new Date();
	}else if(obj.indexOf("-") > 0){
		var year 	=  	obj.substring(0,4);
		var month 	= 	obj.substring(5,7);
		var day 	=	obj.substring(8,10);
		day = new Date(Date.parse(parseInt(year)+'/'+parseInt(month)+'/'+parseInt(day)));
	}else{
		var year 	=  	obj.substring(0,4);
		var month 	= 	obj.substring(4,6);
		var day 	=	obj.substring(6,8);
		day = new Date(Date.parse(parseInt(year)+'/'+parseInt(month)+'/'+parseInt(day)));
	}
	
	if(differ > 0){
		day.setDate(parseInt(day.getDate() + differ));
	}
	
	var d_yr = day.getFullYear();
	var d_mon = addZero(day.getMonth()+1);
	var d_day = addZero(day.getDate());

	var date;
	switch(type){
		case "yyyy-MM-dd":	date = d_yr+"-"+d_mon+"-"+d_day;break;
		case "yyyy/MM/dd":	date = d_yr+"/"+d_mon+"/"+d_day;break;
		case "MM/dd/yyyy":	date = d_mon+"/"+d_day+"/"+d_yr;break;		
		case "yyyy.MM.dd":	date = d_yr+"."+d_mon+"."+d_day;break;
		default:	date = d_yr+""+d_mon+""+d_day;//yyyyMMdd		
	}
	return date;
}

function setDateTime(obj,sHour,sMin,eHour,eMin,branEHour){//시간셋팅 대상, 대여가능 시작시간, 대여가능 시작 분, 대여가능 끝시간, 대여가능 끝 분, 지점운영 끝시간
	console.log("setDateTime 접근");
	if(obj.val()!=''){
		var gubun = obj.attr("name");
		var aHour;
		var bHour;
		if(gubun == "sDate"){
			aHour = $("#sHour").val();
			bHour = $("#lHour").val();
			
			//대여일과 오늘 날짜를 비교해서 예약가능한 시간을 불러와 option을 새로 정의한다.			
			var sDate = dateFormat($("#sDate").val(), "", 0);//yyyyMMdd
			console.log("setDateTime sHour : "+sHour);
			console.log("setDateTime eHour : "+eHour);

			if($.trim($("#reservMenu .selected").text()) == "내륙예약"){
				setInlandHour(sDate, sHour, eHour); //대여일, 대여가능 시작시간, 대여가능 끝시간

				if($("#branchId").val() != "") {
					dsBox('sHour',aHour);
					dsBox('lHour',bHour);		
				}
			} else {
				setHour(sDate, sHour, eHour); //대여일, 대여가능 시작시간, 대여가능 끝시간	
			}
		}else{
			aHour = $("#lHour").val();
		}
		
		var aSHour = $('#sHour').val();
		var aLHour = $('#lHour').val();
		var aSMinute = $('#sMinute').val();
		var aLMinute = $('#lMinute').val();
		var changetime = false;
		
		setTime(aHour,sMin,eMin,branEHour, gubun);//선택한 시간, 대여가능 시작 분, 대여 가능 끝 분, 지점 끝 시간, 구분
	
		// 기본 시간 선택 예약가능한 시간중제일 가까운 시간으로 24시간 정의해줌
		if(aSHour != null && aSHour != ""){
			var maxHour = -1;
			var minHour = 25;
			$('#sHour option').each(function(){
				if(maxHour < parseInt($(this).val())){
					maxHour = $(this).val();
				}
				if(minHour > parseInt($(this).val())){
					minHour = $(this).val();
				}
			});
			if($('#branchId').val()==''){
				minHour = '09';
			}
			
			var tmp = aSHour;
			if(tmp != null && tmp != ''){
				minHour = $('#sHour').val();
			}else if(tmp == null || tmp == ''){
				alert('선택하신 일자의 대여일시는 '+ minHour + "시 ~ " + maxHour + "시 까지 선택 가능합니다.");
				return false;
			}
			dsBox("sHour", minHour);
		}else if(aLHour != null && aLHour != ""){
			var maxHour = -1;
			var minHour = 25;
			
			$('#lHour option').each(function(){
				if(maxHour < parseInt($(this).val())){
					maxHour = $(this).val();
				}
				if(minHour > parseInt($(this).val())){
					minHour = $(this).val();
				}
			});
			
			if($('#branchId2').val()==''){
				minHour = '09';
			}
			var tmp = aLHour;
			if(tmp!=null&&tmp!=''){
				minHour = aLHour;
			}else if(tmp==null||tmp==''){
				alert('선택하신 반납일시는 '+ minHour + "시 ~ " + maxHour + "시 까지 선택 가능합니다.");
				return false;
			}	
			dsBox("lHour", minHour);
		}
		
		var checkLastHour = '0'; //20171228 대여가능시간 변경 
		if($.trim($("#reservMenu .selected").text()) == "내륙예약") checkLastHour = 19 ;
		else if($.trim($("#reservMenu .selected").text()) == "제주예약") checkLastHour = jejuResEndHourNumber ;	//수정
		
		if(aSMinute != null && aSMinute != ""){
			var maxMinute = -1;
			var minMinute = 51;
			$('#sMinute option').each(function(){
				if(maxMinute < parseInt($(this).val())){
					maxMinute = $(this).val();
				}
				if(minMinute > parseInt($(this).val())){
					minMinute = $(this).val();
				}
			});
			var tmp = aSMinute;
			if(tmp != null && tmp != ''){
				minMinute = $('#sMinute').val();
			}else if(tmp == null || tmp == ''){
				alert('선택하신 대여일시는 '+ minMinute + "분 ~ " + maxMinute + "분 까지 선택 가능합니다.");
				return false;
			}	
			
			if(aSHour == checkLastHour && $.trim($("#reservMenu .selected").text()) == "제주예약"){  //20171228 대여가능시간 변경 , 200810 제주일때만 적용
				$("#sMinute option[value=00]").prop("selected", true);
				$("#sMinute").prop("disabled", true);
			}else{
				$("#sMinute").prop("disabled", false);
				dsBox("sMinute", minMinute);
			}
		}else if(aLMinute != null && aLMinute != ""){
			var maxMinute = -1;
			var minMinute = 51;
			$('#lMinute option').each(function(){
				if(maxMinute < parseInt($(this).val())){
					maxMinute = $(this).val();
				}
				if(minMinute > parseInt($(this).val())){
					minMinute = $(this).val();
				}
			});
			var tmp = aLMinute;
			if(tmp!=null&&tmp!=''){
				minMinute = aLMinute;
			}else if(tmp==null||tmp==''){
				alert('선택하신 대여일시는 '+ minMinute + "분 ~ " + maxMinute + "분 까지 선택 가능합니다.");
				return false;
			}
			if(aLHour == checkLastHour-1 && $.trim($("#reservMenu .selected").text()) == "제주예약"){	//20171228 대여가능시간 변경, 200810 제주일때만 적용 
				$("#lMinute option[value=00]").prop("selected", true);
				$("#lMinute").prop("disabled", true);
			}else{
				$("#lMinute").prop("disabled", false);
				dsBox("lMinute", minMinute);
			}
		}
	}
	
	var sDate = dateFormat($('#sDate').val(),'',0);
	var TMP_SDATE = sDate+$('#sHour').val()+$('#sMinute').val();
	var SDATE = TMP_SDATE.length==12?TMP_SDATE:"";
	if(SDATE!=''){	
		if($('#sDate').val() != null && $('#sDate').val() != '') $('#s_date_end').html($('#sDate').val()+" "+$('#sHour').val()+"시 "+$('#sMinute').val()+"분 ");
	}
	
	var lDate = dateFormat($('#lDate').val(),'',0);
	var TMP_LDATE = lDate+$('#lHour').val()+$('#lMinute').val();
	var LDATE = TMP_LDATE.length==12?TMP_LDATE:"";

	if(LDATE!=''){
		if($('#lDate').val() != null && $('#lDate').val() != '') $('#e_date_end').html($('#lDate').val()+" "+$('#lHour').val()+"시 "+$('#lMinute').val()+"분 ");	
	}	
}

function setInlandHour(sDate,sHour,eHour){ //대여일, 대여가능 시작시간, 대여가능 끝시간
	var aHour     = $("#sHour").val(); //선택한 대여시간
	var startHour = (sHour == null ? inlandStartHour : sHour);
	var endHour   = (eHour == null ? inlandEndHour : eHour);
	var possSHour = 0;
	var cHour     = currentDate.getHours();
	var cMin      = currentDate.getMinutes();
	var str1      = "";
	var str2      = "";
	
	if( cHour >= startHour && cHour <= endHour){
		var nDate = currentDate;
		nDate.setHours(nDate.getHours()+24);
		
		possSHour = nDate.getHours();
		
		if(cHour == (endHour-1) && cMin >= 30) {
			possSHour = startHour;
		}
	} else {
		possSHour = startHour;
	}
	
	//내륙은 당일예약 불가능
	if(sDate == parseInt(today_date)+1){ //현재시간 기준 내일
		for(var i=possSHour; i<=endHour;i++){
			if(startHour <= i){
				if(i == aHour) str1+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
				else str1+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
			}
		}
		
		$("#sHour").html(str1);
		dsBox('sHour',possSHour);
		
		for(var i=startHour; i<=endHour;i++){
			if(startHour <= i){
				if(i == aHour) str2+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
				else str2+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
			}
		}
		
		$("#lHour").html(str2);
		dsBox('lHour',possSHour);
	} else { //현재시간 기준 내일이 아닌 경우
		for(var i=startHour; i<=endHour;i++){
			if(startHour <= i){
				if(i == aHour) str1+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
				else str1+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
			}
		}
		
		$("#sHour").html(str1);
		$("#lHour").html(str1);
		dsBox('sHour',startHour);
		dsBox('lHour',startHour);
	}
}

function setHour(sDate,sHour,eHour){ //대여일, 대여가능 시작시간, 대여가능 끝시간
	console.log("setHour 접근");
	var aHour = $("#sHour").val(); //선택한 대여시간
	var menu = $("#reservMenu .selected").text();

	var possSHour=startHour;
	var possEHour=endHour;
	
	//2020.06.10 내륙 기능 삭제
	//var todayStartHour = ($.trim(menu) == "제주예약")  ? jejuTodayStartHourNumber:(sHour == null ? 12 : parseInt(sHour) + 3);
	//var startHour = ($.trim(menu) == "제주예약")  ? jejuStartHourNumber:(sHour == null ? 9 : parseInt(sHour));
	//var endHour = ($.trim(menu) == "제주예약")  ? jejuResEndHourNumber:(eHour == null ? 19 : parseInt(eHour));
	var todayStartHour = jejuTodayStartHourNumber;
	var startHour = jejuStartHourNumber;
	var endHour = jejuResEndHourNumber;
	
	possSHour = s_hour;
	possEHour = parseInt(endHour);
	var possSMin=s_min;
	
	//2020.06.10 내륙 기능 삭제
	//if($.trim(menu) == "내륙예약"){
	//	if(sDate == parseInt(today_date)+1){		//당일예약 다음날 오전 시간셋팅 당일 16~19시일 때 20181204
	//		if(s_hour == 19 && s_min == 30){	//16시 넘어갈때 차일 9시로 셋팅
	//			possSHour = 9;
	//			possSMin = 30;
	//		}else if(s_hour > 19 && s_hour < 22){	//17, 18, 19시 일때
	//			possSHour = s_hour - 10;
	//		}else if(s_hour > 21){ 
	//			possSHour = todayStartHour;
	//			possSMin = 0;
	//		}else{
	//			possSHour = startHour;
	//			possSMin = 0;
	//		}
	//	}else if(sDate == today_date){
	//		if( s_hour < 12 || (s_hour == 12 && s_min == 0)){
	//			possSHour = todayStartHour;
	//			possSMin = 0;
	//		}else{
	//			possSHour = s_hour;
	//		}
	//	}else{	//당일이 아닐때
	//		if(s_hour > 19 || (s_hour == 19 && s_min == 30) || s_hour < 9 || (s_hour == 9 && s_min == 0)){ 
	//			possSHour = startHour;
	//			possSMin = 0;
	//		}
	//	}
	//}else if($.trim(menu) == "제주예약"){
	if(sDate == parseInt(today_date)+1){		//당일예약 다음날 오전 시간셋팅 당일 18~21시일 때 20181204
		if(s_hour == jejuResEndHourNumber && s_min == 30){	//18시 넘어갈때 차일 8시로 셋팅
			possSHour = jejuStartHourNumber;
			possSMin = 30;
		}else if(s_hour > jejuResEndHourNumber && s_hour < 24){	//19, 20, 21시 일때
			possSHour = s_hour - 16;
		}else if(s_hour > 23){
			possSHour = todayStartHour;
			possSMin = 0;
		}else{
			possSHour = startHour;
			possSMin = 0;
		}
	}else if(sDate == today_date){
		if(s_hour < jejuTodayStartHourNumber || (s_hour == jejuTodayStartHourNumber && s_min == 0)){
			possSHour = todayStartHour;
			possSMin = 0;
		}else{
			possSHour = s_hour;
		}
	}else{	//당일이 아닐때
		if(s_hour > jejuResEndHourNumber || (s_hour == jejuResEndHourNumber && s_min == 30) || s_hour < jejuResEndHourNumber || (s_hour == jejuStartHourNumber && s_min == 0)){  //20181204 대여가능시간 변경 
			possSHour = startHour;
			possSMin = 0;
		}
	}
	//2020.06.10 내륙 기능 삭제
	//}
	
	shourFlag = possSHour;
	sMinFlag = possSMin;
	
	var lDate = ""; 
	if($("#lDate").val() != null && $("#lDate").val() != ""){
		lDate = dateFormat($('#lDate').val(),'',0);	
	}
	var str = "";
	var str2 = "";
	
	if((sDate == today_date) || (sDate == parseInt(today_date)+1 && 
			(s_hour > jejuResEndHourNumber || (s_hour == jejuResEndHourNumber && s_min == 30)))
			//2020.06.10 내륙 기능 삭제
			//(($.trim(menu) == "제주예약"	&& (s_hour > jejuResEndHourNumber || (s_hour == jejuResEndHourNumber && s_min == 30))) ||
			//		($.trim(menu) == "내륙예약" && (s_hour > 19 || (s_hour == 19 && s_min == 30)))))
	  ){
		for(var i=possSHour; i<=possEHour;i++){
			if(startHour <= i){
				//2020.06.10 내륙 기능 삭제
				//if( $.trim(menu) == "내륙예약" && sDate == closedStartDate[i] && (closedStartTime[i].substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
				if(i == aHour) str+="<option value='"+addZero(i)+"' selected='selected'>"+addZero(i)+"시</option>" ; 
				else str+="<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>" ; 
			}
		}
		$("#sHour").html(str);
		dsBox('sHour',possSHour);
		
		//2020.06.10 내륙 기능 삭제
		//if($.trim(menu) == "내륙예약"){
		//	for(var i=startHour; i<=possEHour; i++){
		//		if( $.trim(menu) == "내륙예약" && lDate == closedEndDate && (closedEndTime.substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
		//		
		//		str2 += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		//	}
		//	$("#lHour").html(str2);
		//}
		
		dsBox('lHour',possSHour);
		//$('#lHour option[value="'+possSHour+'"]').trigger('change');
		
		if(possSMin == 0){
			$("#sMinute").val("00");
			$("#lMinute").val("00").trigger('change');
		}else{
			$("#sMinute").val("30");
			$("#lMinute").val("30").trigger('change');
		}
		
		if($.trim(menu) == "제주예약" && (possSHour == jejuResEndHourNumber || (possSHour == jejuRtnEndHourNumber && s_min == 30))){
			//dsBox('lHour','20');
			dsBox('lHour',jejuRtnEndHour);
			//$('#lHour option[value="20"]').trigger('change');
		}
	}else{
		console.log("대여일이 내일이 아님");
		console.log("startHour="+startHour);
		console.log("possEHour="+possEHour);
		
		//2020.06.10 내륙 기능 삭제
		//var checkShour = 0;
		//if($.trim($("#reservMenu .selected").text()) == "내륙예약") checkShour = 19 ;
		//else if($.trim($("#reservMenu .selected").text()) == "제주예약") checkShour = jejuResEndHourNumber ;	//수정
		//
		//var startShour = 0;
		//if($.trim($("#reservMenu .selected").text()) == "내륙예약") startShour = 9 ;
		//else if($.trim($("#reservMenu .selected").text()) == "제주예약") startShour = jejuStartHourNumber ;	//수정
		var checkShour = jejuResEndHourNumber;
		var startShour = jejuStartHourNumber;
		var s_possHour;
		
		console.log("DDDDDDDDDDDD : ")
		
		if((sHour >= startShour || sHour <= checkShour) && sHour != null){  //20171228 대여가능시간 변경 
			s_possHour = sHour;
		}else{
			s_possHour = startHour;
		}
		if(sDate == "20200731" &&  $.trim(menu) == "제주예약"){
			possEHour = 21;
		}
		if(sDate == "20200801" &&  $.trim(menu) == "제주예약"){
			s_possHour = 8;
		}
		
		for(var i=s_possHour; i<=possEHour; i++){
			//2020.06.10 내륙 기능 삭제
			//if( $.trim(menu) == "내륙예약" && sDate == closedStartDate[i] && (closedStartTime[i].substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
			str += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		}
		$("#sHour").html(str);
		dsBox('sHour',s_possHour);
		
		//2020.06.10 내륙 기능 삭제
		//if($.trim($("#reservMenu .selected").text()) == "제주예약") possEHour = possEHour-1;	//수정
		//if($.trim($("#reservMenu .selected").text()) == "제주예약") possEHour = jejuRtnEndHourNumber;	// 20200210 수정(제주 반납종료시간으로 수정)
		possEHour = jejuRtnEndHourNumber;
		
		if(lDate == "20200731" &&  $.trim(menu) == "제주예약"){
			possEHour = 21;
		}
		if(lDate == "20200801" &&  $.trim(menu) == "제주예약"){
			startHour = 8;
		}

		for(var i=startHour; i<=possEHour; i++){
			//2020.06.10 내륙 기능 삭제
			//if( $.trim(menu) == "내륙예약" && lDate == closedEndDate && (closedEndTime.substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
			str2 += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		}
		$("#lHour").html(str2);
		dsBox('lHour',startHour);

		$("#sMinute").val("00");
		$("#lMinute").val("00").trigger('change');
		
		//$('#lHour option[value="'+s_possHour+'"]').trigger('change');
		
	}
}

function getTime(){
	var sVal = $('#carTypeName').val();
	var branchId = $('#branchId').val();
	if(branchId != '' && sVal != ''){
console.log("getTime():branchId="+branchId);
		
		$.ajax({
			type : "post",
			url : "/rent/rentcar/getTime.json",
			data : {'carType':sVal
					,'branchId': getSlsBranchCd(branchId)},
			dataType : "json",
			success : function(data) {
				disabled_date = data.timeList;//대여 불가능 날짜
				var size = data.timeList.length;
				if(size > 0){
					//특정일 막기 추가[S]
					resetDatePicker(data.timeList);
					//특정일 막기 추가[E]
				}else{
					var resetDateArr = [new Date()];
					
					var toDay = new Date();
					var nextDay = new Date();
			    	nextDay.setDate(nextDay.getDate()+1);
					var nowHour = toDay.getHours()+1;

					var checkShour = 0;
					if($.trim($("#reservMenu .selected").text()) == "내륙예약") checkShour = 19 ;
					else if($.trim($("#reservMenu .selected").text()) == "제주예약") checkShour = jejuRtnEndHourNumber ;

					if(nowHour > checkShour){  //20171228 대여가능시간 변경 
						resetDateArr.push(nextDay);
			    	}
					resetDatePicker(resetDateArr);
				}
			},
			error : function(){
				alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
			} 
		});	
	}
}

function getTime2(){
	var sVal = $('#carTypeName').val();
	var branchId = $('#branchId').val();
	if(branchId != '' && sVal != ''){
console.log("getTime2():branchId="+branchId);
		
		$.ajax({
			type : "post",
			url : "/rent/rentcar/getTime.json",
			data : {'carType':sVal
					,'branchId': getSlsBranchCd(branchId)},
			dataType : "json",
			success : function(data) {
				disabled_date = data.timeList;//대여 불가능 날짜
				var size = data.timeList.length;
				if(size > 0){
					//특정일 막기 추가[S]
					resetDatePicker(data.timeList);
					//특정일 막기 추가[E]
				}else{
					var resetDateArr = [new Date()];
					
					var toDay = new Date();
					var nextDay = new Date();
			    	nextDay.setDate(nextDay.getDate()+1);
					var nowHour = toDay.getHours()+1;
					
					var checkShour = 0;
					if($.trim($("#reservMenu .selected").text()) == "내륙예약") checkShour = 19 ;
					else if($.trim($("#reservMenu .selected").text()) == "제주예약") checkShour = jejuRtnEndHourNumber ;

					if(nowHour > checkShour){  //20171228 대여가능시간 변경 
						resetDateArr.push(nextDay);
			    	}
					resetDatePicker(resetDateArr);
				}
			},
			error : function(){
				alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
			} 
		});	
	}
}

function setTime(aHour,sMin,eMin,branEHour, gubun){//선택한 시간, 대여가능 시작 분, 대여 가능 끝 분, 지점 끝 시간, 구분
	console.log("setTime 접근");
	console.log("aHour : "+aHour+", sMin : "+sMin+", eMin : "+eMin+", branEHour : "+branEHour+", gubun : "+gubun);
	var lastHour = 0; //20171228 대여가능시간 변경 
	if($.trim($("#reservMenu .selected").text()) == "내륙예약") lastHour = 19;
	else if($.trim($("#reservMenu .selected").text()) == "제주예약") lastHour = jejuResEndHourNumber;
	
	if(branEHour != null && branEHour != "") lastHour = branEHour;//영업 마지막 시간 설정
	
	var this_childern;
	var aMin; 
	if(gubun == "sDate"){
		aMin = $("#sMinute").val();
		this_childern = "sMinute";
	}else if(gubun == "lDate"){
		aMin = $("#lMinute").val();
		this_childern = "lMinute";
		//if($.trim($("#reservMenu .selected").text()) == "제주예약") lastHour = lastHour -1;
		if($.trim($("#reservMenu .selected").text()) == "제주예약") lastHour = lastHour;
	}
	
	var sDate = dateFormat($("#sDate").val(), "", 0);//yyyyMMdd
	
	if($.trim($("#reservMenu .selected").text()) == "제주예약"){
		if(aHour >= lastHour){//선택한 시간이 영업 종료 시간이면		
			console.log("setTime 접근11111111111111111");
			console.log("aHour : "+aHour+" sMin : "+sMin+"eMin : "+eMin+"branEHour : "+branEHour+"gubun : "+gubun);
			$("#"+this_childern).html('<option value="00" selected="selected">00분</option>');
			$("#"+this_childern).prop("disabled", true);		
		}else if(aHour == s_hour && aMin == 30 || 
				(sDate == parseInt(today_date)+1 && 
						(($.trim($("#reservMenu .selected").text()) == "제주예약" && s_hour >jejuResEndHourNumber-1 && aMin==30) ||
						  ($.trim($("#reservMenu .selected").text()) == "내륙예약" && s_hour >18 && aMin==30)) && this_childern == "sMinute" )){
			console.log("setTime 접근222222222222222222");
			console.log("aHour : "+aHour+" s_hour : "+s_hour+"gubun : "+gubun);
			$("#sMinute").html('<option value="30">30분</option>');
			$("#sMinute").prop("disabled", false);
		}else{//선택한 시간이 영업종료 시간이 아니면
			console.log("setTime 접근3333333333333333333");
			console.log("aHour : "+aHour+" s_hour : "+s_hour+"gubun : "+gubun);
			if($("#sHour").attr("disabled") == "disabled"){
				$("#sMinute").prop("disabled", false);
			}else{
				$("#"+this_childern).prop("disabled", false);
			}
			var time_option = "";
			for(var i = 0; i<=30; i+=30){
				var tmp = i<10?"0"+i:i;
				time_option += '<option value="'+tmp+'" '+(aMin==tmp?'selected="selected"':'')+'>';
				time_option += tmp + '분</option>\n';
			}
			$("#"+this_childern).html(time_option);
		}
	} else {
		setInlandTime(gubun);
		checkClosedBranch()
	};
}

function setInlandTime(gubun){
	var pHours        = (gubun == "sDate" ? $('#sHour').val() : $('#lHour').val());
	var pMin          = (gubun == "sDate" ? $('#sMinute').val() : $('#lMinute').val());
	var this_childern = (gubun == "sDate" ? "sMinute" : "lMinute");
	
	if(pHours == gChekInlandSHour) {
		if(gChekInlandSMin != "00"){
			$("#"+this_childern).html('<option value="30" selected="selected">30분</option>');
		} else {
			var time_option = "";
			for(var i = 0; i<=30; i+=30){
				var tmp = i<10?"0"+i:i;
				time_option += '<option value="'+tmp+'" '+(pMin==tmp?'selected="selected"':'')+'>';
				time_option += tmp + '분</option>\n';
			}
			$("#"+this_childern).html(time_option);
		}	
	} else if(pHours == gChekInlandLHour){
		if(gChekInlandLMin == "00"){
			$("#"+this_childern).html('<option value="00" selected="selected">00분</option>');
		} else {
			var time_option = "";
			for(var i = 0; i<=30; i+=30){
				var tmp = i<10?"0"+i:i;
				time_option += '<option value="'+tmp+'" '+(pMin==tmp?'selected="selected"':'')+'>';
				time_option += tmp + '분</option>\n';
			}
			$("#"+this_childern).html(time_option);
		}	
	} else {
		var time_option = "";
		for(var i = 0; i<=30; i+=30){
			var tmp = i<10?"0"+i:i;
			time_option += '<option value="'+tmp+'" '+(pMin==tmp?'selected="selected"':'')+'>';
			time_option += tmp + '분</option>\n';
		}
		$("#"+this_childern).html(time_option);
	}
	
	$("#sMinute").prop("disabled", false);
	$("#lMinute").prop("disabled", false);
	
	if($("#params_sMinute").val() != "" && $("#params_lMinute").val() != ""){
		dsBox("sMinute", $("#params_sMinute").val());
		dsBox("lMinute", $("#params_lMinute").val());
	}
}

function getPossTime(){ //예약 가능한 시간 가져오기
	var sDate = $("#sDate").val(); //yyyy-mm-dd
	var lDate = $("#lDate").val(); //yyyy-mm-dd
	var nextDate = dateFormat(sDate, "yyyy-MM-dd", 1);
	var nnDate = dateFormat(sDate, "", 2);//48시간 후
	var sVal = $('#branchId').val();
	var sVal2 = $('#branchId2').val();
	$("#after48hours").val(nnDate);
	
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	console.log("getPossTime():sDate="+sDate);
	console.log("getPossTime():lDate="+lDate);

	var checkShour = '0'; //20171228 대여가능시간 변경 
	var checkLhour = '0'; //20171228 대여가능시간 변경 
	if($.trim($("#reservMenu .selected").text()) == "내륙예약"){
		checkShour = '09';	
		checkLhour = '19';	
	}else if($.trim($("#reservMenu .selected").text()) == "제주예약"){
		checkShour = jejuStartHour; //수정	
		checkLhour = jejuRtnEndHour; //수정			
		
	}


	if(sDate!=''){
		$("#sHour").prop("disabled", false);
		if($("#sHour").val() == checkShour){  //20171228 대여가능시간 변경 
			$("#sMinute").prop("disabled", true);
		}else{ 
			$("#sMinute").prop("disabled", false);
		}
		if(lDate != ''){
			$("#lDate").removeClass("readonly");
			$("#lHour").prop("disabled", false);
			if($("#lHour").val() == checkShour){  //20171228 대여가능시간 변경 
				$("#lMinute").prop("disabled", true);
			}else{
				$("#lMinute").prop("disabled", false);
			}
		}
		
		if(sVal!=''){ //지점선택부터 했을 경우 가능한 시간대를 먼저 찾아야한다.
			$.ajax({
				type : "post",
				url : "/rent/rentcar/getPossSHour.json",
				data : {'branchId': sVal
						,'branchId2': sVal2
						,'carType' : $('#carTypeName').val()
						,'sDate' : sDate
						,'lDate' : lDate},
				dataType : "json",
				success : function(data) {
console.log("6-1. 지점이 있을 때 대여 가능 시간 셋팅");
					
					var timeList = data.timeList; //대여가능 시간 정보(stHh:대여가능 시작시간 | stMi:대여가능 시작분 | edHh:대여가능 끝시간)
					var LtimeList = data.LtimeList;//반납가능 시간 정보(lEdHh:반납가능 끝시간 | lBranchEdHh:해당 지점의 클로징시간 | lStHh:반납가능 시작시간 | lEdMi:반납가능 마지막 분)
					
					if($.trim($("#reservMenu .selected").text()) == "제주예약"){
						timeList.edHh = checkLhour;
						timeList.stHh = checkShour;
					}
					else {
						gChekInlandSHour = timeList.stHh; // 내륙 업무 시작시간 체크
						gChekInlandSMin = timeList.stMi; // 내륙 업무 시작분 체크
						gChekInlandLHour = timeList.edHh; // 내륙 업무 종료시간 체크
						gChekInlandLMin = timeList.edMi; // 내륙 업무 종료분 체크
					}	
					
					console.log("getPossSHour.json 성공");
					console.log("getPossSHour.json stHh : " + timeList.stHh);
					console.log("getPossSHour.json edHh : " + timeList.edHh);
					//해당지점의 영업일시간 기준으로 시간과 분셋팅
					setDateTime($("#sDate"),timeList.stHh,timeList.stMi,timeList.edHh,timeList.edMi,timeList.edHh);					
					
					if(lDate <= sDate && lDate!=''){
						alert('반납일시는 대여일시 보다 커야합니다.');
					}
					
					if(sVal2 != ''){
						$.ajax({
							type : "post",
							url : "/rent/rentcar/getPossLHour.json",
							data : {'branchId': sVal
									,'branchId2': sVal2
									,'carType' : $('#carTypeName').val()
									,'sDate' : sDate
									,'lDate' : lDate},
							dataType : "json",
							success : function(data) {
								console.log("대여 가능한 날짜를 확인한 후 실행되는 ajax로 반납 가능 여부를 판단한다.");
								
								var LtimeList = data.LtimeList;
								gChekInlandSHour = timeList.stHh; // 내륙 업무 시작시간 체크
								gChekInlandSMin = timeList.stMi; // 내륙 업무 시작분 체크
								gChekInlandLHour = LtimeList.lEdHh; // 내륙 업무 종료시간 체크
								gChekInlandLMin = LtimeList.lEdMi; // 내륙 업무 종료분 체크
								
								if($.trim($("#reservMenu .selected").text()) == "내륙예약"){
									$("#txtSlsBranch").html(
											"예약가능시간 : <span class='cl-point1'>"+ $('#sel2_che').text() + "(대여 " 
											+ timeList.stHh + ":" + timeList.stMi +"~" + timeList.edHh + ":" + timeList.edMi + " / 반납 " 
											+ LtimeList.lStHh + ":" + LtimeList.lStMi + "~" + LtimeList.lEdHh + ":" + LtimeList.lEdMi + ")</span>");
								}
								
								// 시작일자 변경시 종료일자 셋팅
								setDateTime($('#lDate'), LtimeList.lStHh, LtimeList.lStMi, LtimeList.lEdHh, LtimeList.lEdMi, LtimeList.lBranEdHh);
								
								if(sVal != "000012" && sVal == ""){
									getBranchList();	
								}
								
								/*
								if($("#carTypeName").val() != null || $("#carTypeName").val() != ""){
									console.log("-------------------------6");
									getCar();
								}
								*/
								
								if(disabled_date != null){
									var isOk = true;
									for(var i = 0; i <disabled_date.length; i++){
										if($('#sDate').val() <= disabled_date[i].V_DATE
												&& $('#lDate').val() > disabled_date[i].V_DATE){
											isOk = false;
										}
									}
									
									console.log("isOK = "+isOk);
									if(!isOk){
										alertMsg("time");
										return false;
									}else{
										console.log("carTypeName="+$('#carTypeName').val());
										getCar();
										
										console.log("9-1. 날짜 선택 후 가격 계산");										
										getPayment();
									}
								}else{
									getCar();
									
									console.log("9-2. 날짜 선택 후 가격 계산");		
									getPayment();
								}
							},
							error : function(){
								alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
							} 
						});	
					}else{
						console.log("9-3. 종료일자 셋팅");
						setDateTime($('#lDate'),null,null,null,null);
						getCar();
					}
				},
				error : function(){
					alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
				} 
			});	
	 	}else{
	 		console.log("1. 날짜를 선택하면 해당 날짜에 대여가능한 시간을 가져와 셋팅");
			setDateTime($('#sDate'),null,null,null,null); //대여일에 따라 대여시간, 분, 반납시간, 분 지정
			
			console.log("1. 지점 선택이 없을 때 반납날짜 실행");
			setDateTime($("#lDate"),null,null,null,null);
			
			console.log("2. 날짜를 선택하면 해당 날짜에 대여가능한 시간을 가져와 셋팅한 후에 대여가능한 지점을 불러온다.");
			getBranchList();//가능 지점 가져오기
			
			console.log("3. 날짜를 선택하면 해당 날짜에 대여가능한 시간을 가져와 셋팅한 후에 대여가능한 차량을 불러온다.");		
			getCar();
			
	 	}
	}	
}

function getPossLtime(obj){
	var sDate = $("#sDate").val(); //yyyy-mm-dd
	var lDate = $("#lDate").val(); //yyyy-mm-dd
	var sVal = $('#branchId').val();
	var sVal2 = $('#branchId2').val();
	
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	
	if(sVal!='' && sVal2!=''){ //대여지역, 반납지역 모두 선택되어있을 때
		$.ajax({
			type : "post",
			url : "/rent/rentcar/getPossLHour.json",
			data : {'branchId': sVal
					,'branchId2':sVal2
					,'carType' : $('#carTypeName').val()
					,'lDate' : lDate
					,'sDate' : sDate},
			dataType : "json",
			success : function(data) {
console.log("getPossLtime(obj)\n getPossLHour.json 대여지점, 반납지점 선택이 있을 때 실행");
console.log(data);
console.log(data.LtimeList.lStHh);
				// 시작일자 변경시 종료일자 셋팅
				setDateTime($('#lDate'), data.LtimeList.lStHh, data.LtimeList.lStMi, data.LtimeList.lEdHh, data.LtimeList.lEdMi, data.LtimeList.lBranEdHh);
				if(sVal != "000012" && sVal == "") getBranchList();
				if($("#carTypeName").val() != null || $("#carTypeName").val() != ""){
					console.log("-------------------------6");
					getCar();
				}
			},
			error : function(){
				alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
			} 
		});	
	}else{//지점 선택이 없을 때 실행
console.log("지점 선택이 없을 때 반납날짜 실행");
		setDateTime($("#lDate"),null,null,null,null);
		getBranchList();
		if($("#carTypeName").val() == null || $("#carTypeName").val() == ""){
			getCar();
		}
	}
}

function getOneway(){
	var sDate = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	
	var lDate = "";
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	
	var sVal = $('#branchId').val();
	var sVal2 = $('#branchId2').val();
	var TMP_SDATE = sDate +$('#sHour').val()+$('#sMinute').val();
	var SDATE = TMP_SDATE.length==12?TMP_SDATE:"";
	var TMP_LDATE = lDate +$('#lHour').val()+$('#lMinute').val();
	var LDATE = TMP_LDATE.length==12?TMP_LDATE:"";
	
	$.ajax({
		type : "post",
		url : "/rent/rentcar/getOneWay.json",
		data : { 'branchId':sVal },
		dataType : "json",
		success : function(data) {
console.log("대여지점이 바뀔때 실행되는 getOneWay.json");
			var oneWay;
			var cls = $("#userClass").val();
console.log("cls="+cls);
			if(cls == 1){
				oneWay = 0;
			}else{
				oneWay = data.oneWayCount;
			}
console.log("oneWay="+oneWay);			

			if(parseInt(oneWay) == 0){//편도 선택 불가능일 때
				$('#branchId2').prop('disabled',true); //비활성;
				dsBox('branchId2',sVal);
				$('#branchId2 option[value="'+sVal+'"]').trigger('change'); 
			}else{//편도 선택 가능할 때
				$('#branchId2').prop('disabled',false);
				
				if(sVal2 != ""){
					dsBox('branchId2',sVal2);
					$('#branchId2 option[value="'+sVal2+'"]').trigger('change');
				}else{
					dsBox('branchId2',sVal);
					$('#branchId2 option[value="'+sVal+'"]').trigger('change');
				}				
			}

console.log("6. 날짜 지정이 없을 때, 대여지점이 선택될 때 실행되는 getTime()");	
			if(sDate == null || sDate == "") getTime();
		},
		error : function(){
			alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
		} 
	});	
}

function setCarList(flag, orgnCarID, carID, type, carTypeNm, num, cd){
	var str="";	
	var dcCardId = $("#dcCardId").val();
	var corpNm = $("#corpNm").val();
	
	if(num == "0" || num == type) // num이 0이면 모든차,  num=0이 아닐때는 num=type일때 해당차종만
	{
		str += "<li>";
		if(flag){
			str += "<a href='javascript:void(0);' class='cl-thin' data-orgn='"+orgnCarID+"' data-cartype='"+carID+"' data-car='"+type+"' data-carcd='"+cd+"'>";
		}
		// VIP 제휴 쿠폰 유무 체크
		else if ( dcCardId == "P00000028232" || corpNm == "vip" ){
			// 수입/전기차일때 선택 안되게 막음
			if(type == 6){
				str += "<a href='javascript:void(0);' class='cl-thin' data-orgn='"+orgnCarID+"' data-cartype='"+carID+"' data-car='"+type+"' data-carcd='"+cd+"'>";
			}else{
				str += "<a href='javascript:void(0);' data-orgn='"+orgnCarID+"' data-cartype='"+carID+"' data-car='"+type+"' data-carcd='"+cd+"'>";
			}
		}
		else{
			str += "<a href='javascript:void(0);' data-orgn='"+orgnCarID+"' data-cartype='"+carID+"' data-car='"+type+"' data-carcd='"+cd+"'>";
		}
		
		str += carTypeNm;
		str += "</a>";
		str += "</li>\n";
	}	
	return str;
}

function getCar(){
	//$("#ldwId2").val("");
	var aCarTypeName = $('#orgnCartype').val();
	var aCarTypeNameText = "";
	var sVal="";
	$(".carList li a").each(function(){
		if($(this).attr("data-orgn") == aCarTypeName){
			aCarTypeNameText = $(this).text().trim();
			sVal = $(this).attr("data-car");
		}
	});
	
	var sDate = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	
	var lDate = "";
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	
	var TMP_SDATE = sDate +$('#sHour').val()+$('#sMinute').val();
	var SDATE = TMP_SDATE.length==12?TMP_SDATE:"";
	var TMP_LDATE = lDate +$('#lHour').val()+$('#lMinute').val();
	var LDATE = TMP_LDATE.length==12?TMP_LDATE:"";
	var BRANCH_ID = $('#branchId').val();
	
	var SLS_BRANCH_CD = getSlsBranchCd($('#branchId').val());
	if(SLS_BRANCH_CD!=''){
		var tmp = SLS_BRANCH_CD;
		SLS_BRANCH_CD = BRANCH_ID;
		BRANCH_ID = tmp;
	}
	
	$.ajax({
		type : "post",
		url : "/rent/rentcar/getCar.json",
		data : {
			'carType':"",
			'branchId': BRANCH_ID
			, 'sDate' : SDATE
			, 'lDate' : LDATE
			, 'slsBranchCd':SLS_BRANCH_CD 
			, 'dcCardId' : $("#dcCardId").val()
			, 'pLdwRtCd'     : $('#ldwId').val()},
		dataType : "json",
		success : function(data) {
console.log("getCar()\n 차량 정보를 가져오는 getCar.json");
			var list = data.carList;
			var RSV_PSBL_CNT;
			var htmlStr=""; 
			var htmlStr1="";
			var htmlStr2="";
			var htmlStr3="";
			var htmlStr4="";
			var htmlStr5="";
			var htmlStr6="";
			var htmlStr7="";
			//var nullCarCheck="";
			
			for(var i = 0; i<list.length; i++){
				if(list[i].rsvPsblCnt!=null){
					RSV_PSBL_CNT = list[i].rsvPsblCnt;
				}else{
					RSV_PSBL_CNT = list[i].carCnt=='예약완료'?"0":list[i].carCnt;	
				}
				
				var cd = list[i].carShtRsvClsCd;
				var type;
				switch(cd){
				case "232001":
				case "232002":	type = 1;break;
				case "232003":type = 2;break;
				case "232004":
				case "232006":type = 3;break;
				case "232005":type = 4;break;
				case "232007":
				case "232008":type = 5;break;
				case "232009":type = 6;break;
				}
				var fuelCd = list[i].fuelCd;
				var cartypeDtlNm = list[i].cartypeDtlNm||' ';
				
				//cartypeDtlNm!=null?cartypeDtlNm:"";
				
				if(fuelCd == "210007" || cartypeDtlNm.indexOf('전기차') > 0){
					type = 6;
				}
				
				htmlStr += setCarList((parseInt(RSV_PSBL_CNT)==0?true:false), list[i].origCartypeDtlId, list[i].cartypeDtlId, type, list[i].cartypeDtlNm, 0, cd);
				htmlStr1 += setCarList((parseInt(RSV_PSBL_CNT)==0?true:false), list[i].origCartypeDtlId, list[i].cartypeDtlId, type, list[i].cartypeDtlNm, 1, cd);
				htmlStr2 += setCarList((parseInt(RSV_PSBL_CNT)==0?true:false), list[i].origCartypeDtlId, list[i].cartypeDtlId, type, list[i].cartypeDtlNm, 2, cd);
				htmlStr3 += setCarList((parseInt(RSV_PSBL_CNT)==0?true:false), list[i].origCartypeDtlId, list[i].cartypeDtlId, type, list[i].cartypeDtlNm, 3, cd);
				htmlStr4 += setCarList((parseInt(RSV_PSBL_CNT)==0?true:false), list[i].origCartypeDtlId, list[i].cartypeDtlId, type, list[i].cartypeDtlNm, 4, cd);
				htmlStr5 += setCarList((parseInt(RSV_PSBL_CNT)==0?true:false), list[i].origCartypeDtlId, list[i].cartypeDtlId, type, list[i].cartypeDtlNm, 5, cd);
				htmlStr6 += setCarList((parseInt(RSV_PSBL_CNT)==0?true:false), list[i].origCartypeDtlId, list[i].cartypeDtlId, type, list[i].cartypeDtlNm, 6, cd);
				
				/*
				if(list[i].cartypeDtlNm.indexOf("스파크") >= 0){				
					nullCarCheck = i;
					console.log(" nullCarCheck1: ", nullCarCheck );
				}
				*/
			}
			console.log(" htmlStr1: ", htmlStr1 );
			
			$("#car-type0 .carList").html(htmlStr);
			$("#car-type1 .carList").html(htmlStr1);
			$("#car-type2 .carList").html(htmlStr2);
			$("#car-type3 .carList").html(htmlStr3);
			$("#car-type4 .carList").html(htmlStr4);
			$("#car-type5 .carList").html(htmlStr5);
			$("#car-type6 .carList").html(htmlStr6);
			
			/*
			if(nullCarCheck == ""){
				htmlStr7 = "<li><a href='javascript:void(0);' class='cl-thin' data-orgn='CH0901' data-cartype='0000000' data-car='1' data-carcd='232003'>스파크 [가솔린]</a></li>";
				console.log(" htmlStr7: ", htmlStr7 );
				$("#car-type0 .carList").append(htmlStr7);
				$("#car-type1 .carList").append(htmlStr7);
			}
			*/
			
			if(aCarTypeName != '' && aCarTypeName != null){//선택한 값
				var cnt = 0;
				$(".carList li a").each(function(){
					var cartypeNm = $(this).attr("data-orgn");
					var cartypeId = $(this).attr("data-cartype");
					
					if(aCarTypeName == cartypeNm){
						cnt += 1;
						if($(this).attr("class") == "cl-thin"){//비활성화
							alertMsg("car");
							$("#modelNm").text("");
							return false;
						}else{
							$(this).addClass("cl-point1 wg-bold");
							$("#carTypeName").val(cartypeId);
							ldwAbleCheck();
							getPayment();
						}
					}
				});
				if(cnt <= 0){
					//alert("해당 지점에는 해당 차량이 없습니다.");
					$("#modelNm").html("");
					$("#carTypeName").val("");
					$("#orgnCartype").val("");
					ldwAbleCheck();
					getPayment();
				}
			}
			
		    // ---click-car
			//차량 선택 시 css 적용, carTypeName에 값 세팅하는 스크립트[S]
			$(".carList li a").on('click', function(){
				_last_event_obj = 'car'; // 차량을 클릭했음
				
				// 차량손해면책제도 초기화
				$("#ldwList li").removeClass('selected');
				$("#benz_ldw li").removeClass('selected');
				$("#ldwId").val("");
				$("#ldwId2").val("");
				
				var $this = $(this);
				var thisClass = $this.attr("class");
				
				if(thisClass== "cl-point1 wg-bold") //이미선택한 차를 재 선택하면 선택취소로 처리
				{
					$this.removeClass('cl-point1 wg-bold');
					$("#carTypeName").val('');
					$("#orgnCartype").val('');
					$("#selCarType").val('');
					$("#selCarCd").val('');
					
					getTime2();
					ldwAbleCheck();
					if($("#branchId").val() != '000012'){ //제주지점이 아니면 실행가능한 지점 불러온다
						getBranchList();
					}
					getPayment();
					$("#modelNm").text("");
					
					checkLicenseInput11();
					return;
				}
				
				if(thisClass != "cl-thin"){
					$(".carList li a").removeClass('cl-point1 wg-bold');
					var str = $(this).text().trim();
					var orgn = $(this).attr('data-orgn');
					var type = $(this).attr('data-cartype');
					var cd = $(this).attr('data-car');
					var carCd = $(this).attr('data-carcd');

					if( carCd == "232009" && $("#branchId").val() == "000012"){//제주 수입차 기존 :type.substring(0,2) == "BE" && $("#branchId").val() == "000012"
						if($("#ldw-all-li") != null) $("#ldw-all-li").hide();
						//$("#benz_check").show();
					}else{
						if($("#ldw-all-li") != null) $("#ldw-all-li").show();
						//$("#benz_check").hide();
					}
					
					$("#carTypeName").val(type);
					$("#orgnCartype").val(orgn);
					$("#selCarType").val(cd);
					$("#selCarCd").val(carCd);
					$(".carList li a[data-orgn="+orgn+"]").addClass('cl-point1 wg-bold');
					
					var carNm = $this.text();
					$("#modelNm").html(carNm);
					
					//수입차 면허체크
					if( !checkLicenImports(carCd) ){
						hasCheckCar = true;
					}else{
						hasCheckCar = false;
					}
					//console.log($("#carTypeName").val()+"타야!!!");
					/*
					 * 	12인승 차량 선택 시 alert
					 * */
					$.ajax({
						url : '/rent/rentcar/getCDVal.json',
						type : 'POST',
						dataType : 'json',
						data : {"carTypeName":$("#carTypeName").val()},
						success : function(data) {
							//26세 이상 체크
							var cdcheck = true;
							if(data.cdCnt > 0){
								hasCDVal = data.cdCnt; 
								var sDate = $("#sDate").val();
								var userNm = $("[name=userNm]").val();
								var birthday = $("[name=birthday]").val();
								var licenseType = $("[name=licenseType]").val();
								var licenseNo = $("[name=licenseNo]").val();								
								var branchId = $('#branchId').val();
								var branchId2 = $('#branchId2').val();
								
								if(sDate != "" && userNm != "" && birthday != "" && licenseType != "" && licenseNo != "" && branchId != "" && branchId2 != ""){
									
								}else{
									alert("해당 차량은 26세 이상, 면허 취득 3년 이상,\n면허 종별로 1종 보통 이상이 아니면 대여 거부 될 수 있습니다.");
								}
																
								hasCheckCar = true;
								//라이센스 유효성관련
								checkLicenseInput11();
							}else{
								hasCDVal = 0; 
								hasCheckCar = false;
								//라이센스 유효성관련
							}

							if($("#userClass").val() != "1"){
								checkingLicenseIssued();	
							}
						},
						error : function(xhr, status, error) {
							console.log(error);
							console.log(arguments);
						}
					});

					getTime2();
					ldwAbleCheck();
					if($("#branchId").val() != '000012'){ //제주지점이 아니면 실행가능한 지점 불러온다
						getBranchList();
					}
					console.log("9-0. 차량 선택 시 가격 계산");
					
					$("#alert-cartype").removeClass("msg-alert");
					$("#span-cartype").html("");
					getPayment();
					checkLicenseInput11();
					
					if($("#branchId").val() != '000012'){ //200811 제주지점이 아닐경우, 날짜/시간/지점 선택전에 차량을 선택한 경우
						if($("#sDate").val() == "" || $("#branchId").val() == "") {
							alert("기간/지점 선택을 설정 해주세요. 선택된 차량에 따라 예약 가능한 지점만 노출됩니다.");	
						}
					}
				}else{
					
					checkLicenseInput11();
					alert('선택하신 차량은 예약이 완료되어 예약이 불가능 합니다.');
				}
			});
		},
		error : function(){
			alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
		} 
	});
	
	changeHourDisabled();
}

function getldw(){
	var branchId = $('#branchId').val();
	var carModel = $('#carTypeName').val();
	var aLdwId = $('#ldwId').val();
	
	if(branchId != ''&& carModel != ''){
		$.ajax({
			url : "/rent/rentcar/getLdw.json",
			type : "post",
			data : JSON.stringify({"branchId":branchId, "carTypeName":carModel}),
			dataType : "json",
			contentType:"application/json",
			success : function(data){
				//console.log("getldw()\n지점선택,차량선택을 했을 때 실행되는 getLdw.json");
				
				var map = data.timeList;				
				var ldw = map.ldw.split(',');
				var str = '';
				var val = '';
				for(var i = 0; i < ldw.length; i++){
					var tmp = ldw[i].split("@");
					if(i==0) str += '<li class="col-4">';
					else str += '<li class="col-4">';
					if(tmp[0] == '428001') val = 50;
					if(tmp[0] == '428002') val = 30;
					if(tmp[0] == '428003') val = 5;
					if(i==0) str += '<a href="#none" data-cd="'+tmp[0]+'">'+tmp[1]+'</a>';
					else str += '<a href="#none" data-cd="'+tmp[0]+'">'+tmp[1]+'<br /><span>면책금 '+val+'만원</span></a>';
					str += '</li>';
				}
				
				$('#ldwList').html(str);
				
				// --- click ldwList li div 차량면책
				$("#ldwList li div").on('click', function(){
					console.log("--- click-#ldwList li div 차량면책");
					$("#content-div").find(".msg-alert").removeClass("msg-alert");
					$("#content-div").find(".msg-txt").text("");
					
					$("#ldwList li").removeClass('selected');
					$(this).parent().addClass("selected");
					
					var cd = $(this).attr("data-cd");
					$("#ldwId").val(cd);
					$("#ldwId2").val(cd);

					if(cd == '428004'){//완전 자차 선택 시(제주도만 있음)
						console.log("999line="+userClass);
						if(userClass == 0){//회원일 때
							$(".ldw-all").addClass("essential");
							$(".ldw-all").append("<strong class=\"check\">필수</strong>");
						}
					}else{
						$(".ldw-all").removeClass("essential");
					}
					getPayment();
				});
				
				if(aLdwId==null||aLdwId==''||aLdwId=='undefined'){
					$("#ldwList li div[data-cd=428009]").parent().addClass("selected");
					alert('자차 보험 종류를 확인하여 주시기 바랍니다.');
				}else{
					$("#ldwList li").removeClass('selected');
					$("#ldwList li div[data-cd="+aLdwId+"]").parent().addClass("selected");
					$("#ldwList li div[data-cd="+aLdwId+"]").trigger("click");
				}
				getPayment();
			},
			error : function(){
				alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
			}
		}); 
	}
}

function getPayment() {
	var model       = $("#carTypeName").val();
	var branchId    = $("#branchId").val();
	var branchId2    = $("#branchId2").val();
	var ldwId = ($("#ldwId").val() == "" ? '428009' : $("#ldwId").val()); //200625 차량손해면책제도 선택이 안되도 금액이 계산되도록 변경
	var benzYn = "";
	
	if(model.substring(0,2) == "BE"){
		benzYn = $("[name=benzYn]").is(":checked")?$("[name=benzYn]").val():"";
	}

	var sDate = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	
	var lDate = "";
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	
	sDate = sDate + $("#sHour").val() + $("#sMinute").val();
	lDate = lDate + $("#lHour").val() + $("#lMinute").val();
	
	if(model != null && model != '' && branchId != null && branchId != '' && branchId2 != null && branchId2 != '' 
			&& sDate != null && sDate != '' && lDate != null &&	lDate != '' && sDate.length == 12 && lDate.length == 12 && ldwId != ""){
		//console.log("ldwID="+ldwId);

		var data = {
			"branchId" : branchId
			,"branchId2" : branchId2
			,"sDate" : sDate
			,"lDate" : lDate
			,"model" : model
			,"dcCardId" : $("#dcCardId").val()
			,"ldwId" : ldwId
			,"benzYn" : benzYn
			,"loginId" : $("#tMode").val() 
		};		
		
		//금액 계산
		$.ajax({
			type : "post",
			url : "/rent/rentcar/getRentPayment.json",
			data : JSON.stringify(data),
			dataType : "json",
			contentType:"application/json",
			mimeType: 'application/json',
			processData : false,
			cache : false,
			success : function(data) {
				//console.log("getPayment()\n getRentPayment.json");
				var rentTerm;
				var payment = 0;
				var nRate 		= data.noRate;//정상대여료
				
				var discount	= data.discount;//총 할인금액
				var iRate 		= data.inRate;//면책보상수수료
				var dcRate 		= data.dcRate;//할인 후 결제 금액
				var oneWay 		= data.oneWay;//편도 수수료
				var benzAmt 	= data.benzPromotionAmt;//벤츠 프로모션 할인가격
				var branchDcAmt = data.branchDcAmt; //지점추가할인금액	
				//console.log(nRate+"\n"+discount+"\n"+iRate+"\n"+dcRate+"\n"+oneWay+"\n"+benzAmt);
				

				// 2014-09-02 : OCB 할인 추가 : P00000028041
				var ocbDiscount = 0; //OCB 할인
				var totalPayment = 0; //OCB 최종
				if(nRate > 0){
					payment = nRate*1 - discount*1 + iRate*1 + oneWay*1 - benzAmt*1 ;
				}

				if(parseInt(payment) >= 0 ){
					$("#rateAmt").html(formatCommas(nRate*1+""));//표준금액
					console.log("nRate : ", nRate);
					if(nRate > 0){
						$(".through_line_span").show();
						$("#rateAmtView").html(formatCommas(nRate*1+""));//표준금액
					}else{
						$(".through_line_span").hide();
					}
					$("#oneWay").html(formatCommas(oneWay*1+""));//편도수수료					
					

					$("#iRateAmt").html(formatCommas(iRate*1+"")); //자차면책보상금
					var ldwNm = "";
					if(ldwId == '428001') ldwNm="일반 자차";
					if(ldwId == '428002') ldwNm="PLUS 자차";
					if(ldwId == '428003') ldwNm="SUPER 자차";
					if(ldwId == '428004') ldwNm="완전 자차";
					if(ldwId == '428009') ldwNm="선택안함";
					$("#ldwNm").html("└  "+ldwNm);//보험명칭
					
					$("#discountAmt").html("-"+formatCommas(discount*1+""));//할인금액
					$("#rentPayment").html(formatCommas(payment+"")); //총 결제금액
					$("#eventAmt").html("-"+formatCommas(benzAmt+""));//벤츠 프로모션 할인가격
					
					if(branchDcAmt != 0){
						$("#event_apply").show();
					} else {
						$("#event_apply").hide();
					}
				}
				
				changeHourDisabled();
			},
			error : function(){
				alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
			} 
		});	
	}else{
		$("#rateAmt").html("0");//표준금액
		$("#rateAmtView").html("0");//표준금액
		$("#oneWay").html("0");//편도수수료
		$("#iRateAmt").html("0"); //자차면책보상금
//		$("#ldwNm").html("└  선택안함");//보험명칭
		$("#discountAmt").html("-0");//할인금액
		$("#rentPayment").html("0"); //총 결제금액
		$("#eventAmt").html("-0");//벤츠 프로모션 할인가격
		changeHourDisabled();
	}
}

function chkRentTerm(){
	console.log("chkRentTerm 접근");

	if( $('#sDate').val() != '' && $('#lDate').val() != '' &&
		$('#sHour').val() != '' && $('#lHour').val() != '' &&
		$('#sMinute').val() != '' && $('#lMinute').val() != ''
	){ //대여일,시간,분 / 반납일,시간,분 모두 선택했을 때
		console.log("1-3. 대여 시간 24시간 이하/이상 확인");
		console.log("$('#sHour').val() : "+$('#sHour').val());
		console.log("$('#lHour').val() : "+$('#lHour').val());
		
		var menu = $("#reservMenu .selected").text();
		var shour = parseInt($('#sHour').val())+(parseInt($('#sMinute').val())>30?1:0); 
		var lhour = parseInt($('#lHour').val())+(parseInt($('#lMinute').val())>30?1:0);
		var sMin = parseInt($('#sMinute').val());
		var lMin = parseInt($('#lMinute').val());
		var sDate = dateFormat($('#sDate').val(),'',0);
		var lDate = dateFormat($('#lDate').val(),'',0);
		
		var chDate = new Date (sDate.substr(0,4),(sDate.substr(4,2))-1,sDate.substr(6,2),$('#sHour').val());
		var chDate2 = new Date (lDate.substr(0,4),(lDate.substr(4,2))-1,lDate.substr(6,2),$('#lHour').val());
		
		console.log("(chDate2 - chDate)="+(chDate2 - chDate));
		console.log("((chDate2 - chDate)/24/60/60/1000)="+((chDate2 - chDate)/24/60/60/1000));
		
		if(sDate == "20200731" &&  $.trim(menu) == "제주예약" && shour == "21"){
			$("#sMinute").val("00");
			setTimeout(function(){
				$("#sMinute").prop("disabled", true);
				getPayment();
			});
		}
		if(lDate == "20200731" &&  $.trim(menu) == "제주예약" && lhour == "21"){
			setTimeout(function(){
				$("#lMinute").val("00");
				$("#lMinute").prop("disabled", true);
			getPayment();
			});
		}
		
		if(((chDate2 - chDate)/24/60/60/1000)<1){
			if(shour>lhour){
				alert("대여기간이 24시간 미만인 경우 할인혜택이 적용되지 않습니다.");
			}
		}else if(((chDate2 - chDate)/24/60/60/1000) == 1 ){
			if(sMin > lMin){
				alert("대여기간이 24시간 미만인 경우 할인혜택이 적용되지 않습니다.");				
			}
		}
	}
}

var jejuFlag=true;
function init(){
	console.log("init 접근");
	var possSHour=s_hour;
	var possSMin=s_min;
	
	var menu = $("#reservMenu .selected").text();
	menu = menu.trim();
	var str = "";
	var str2 = "";
	switch(menu){
	case "내륙예약" : //20171228 대여가능시간 변경 
		for(var i=9; i<19; i++){
			if( dateFormat($("#sDate").val(),'',0) == closedStartDate[i] && (closedStartTime[i].substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
			str += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		}
		$("#sHour").append(str);
		
		for(var i=9; i<19; i++){
			if( dateFormat($("#lDate").val(),'',0) == closedEndDate[i] && (closedEndTime[i].substring(0,2).indexOf(addZero(i)) !== -1 )){continue};
			str2 += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		}
		$("#lHour").append(str2);
		jejuFlag=false;
		
		var cHour = currentDate.getHours();
		var cMin = currentDate.getMinutes();
		
		if( cHour >= inlandStartHour && cHour < inlandEndHour){
			var nDate = currentDate;
			nDate.setHours(nDate.getHours()+24);
			
			possSHour = nDate.getHours();
			possSMin = 0;
			
			if(cHour == (inlandEndHour-1) && cMin >= 30) {
				possSHour = inlandStartHour;
				possSMin = 0;
			}
		} else {
			possSHour = inlandStartHour;
			possSMin = 0;
		}
		
		break;
	case "제주예약" :
		//20171228 대여가능시간 변경 //제주예약은 20시까지
		//20200210 대여가능시간 변경 //제주예약은 22시까지
		for(var i=jejuStartHourNumber; i<jejuResEndHourNumber+1; i++){
			str += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		}
		$("#sHour").append(str);
		//20180105 제주 대여반납 시간 조정
		str = "";
		//20171228 대여가능시간 변경 //제주예약은 20시까지
		//20200210 대여가능시간 변경 //제주예약은 22시까지
		for(var i=jejuStartHourNumber; i<jejuResEndHourNumber+1; i++){
			str += "<option value='"+addZero(i)+"'>"+addZero(i)+"시</option>";
		}
		
		$("#lHour").append(str);
		
		if(s_hour == jejuResEndHourNumber && s_min == 30){	//16시 넘어갈때 차일 9시로 셋팅
			possSHour = jejuStartHourNumber;
			possSMin = 30;
		}else if(s_hour > jejuResEndHourNumber && s_hour < 24){	//17, 18, 19시 일때
			possSHour = s_hour - 16;
		}else if(s_hour > 23 || s_hour < jejuTodayStartHourNumber || (s_hour == jejuTodayStartHourNumber && s_min == 0)){ 
			possSHour = jejuTodayStartHourNumber;
			possSMin = 0;
		}
		break;
	}
	
	possSHour = addZero(possSHour);
	possSMin = addZero(possSMin);
	
	var pSHour = $("#params_sHour").val();
	var pLHour = $("#params_lHour").val();
	
	if(pSHour != ""){
		dsBox('sHour',pSHour);
		$('#sHour option[value="'+pSHour+'"]').trigger('change');
		$('#sHour').prop('disabled', true);
	}else{
		dsBox('sHour',possSHour);
		$('#sHour option[value="'+possSHour+'"]').trigger('change');
		$('#sHour').prop('disabled', true);
		
		if((menu == "제주예약" && s_hour == jejuResEndHourNumber && s_min == 0) || (menu == "내륙예약" && s_hour == 19 && s_min == 0)){
			$("#sMinute").val("00").trigger('change');
		}else{
			$("#sMinute").val(possSMin).trigger('change');
		}
	}

	if(pLHour != ""){
		dsBox('lHour',pLHour);
		$('#lHour option[value="'+pLHour+'"]').trigger('change');
		$('#lHour').prop('disabled', true);
		
		if((menu == "제주예약" && pLHour > jejuRtnEndHourNumber) || (menu == "내륙예약" && pLHour == 19) ){  //20171228 대여가능시간 변경 
			$("#lMinute").html('<option value="00" selected="selected">00분</option>');
			//$("#lMinute option[value=00]").prop("selected", true);
			$("#lMinute").prop("disabled", true);
		}else{
			$("#lMinute").prop("disabled", false);
			var time_option = "";
			for(var i = 0; i<=30; i+=30){
				var tmp = i<10?"0"+i:i;
				time_option += '<option value="'+tmp+'" '+($("#sMinute").val()==tmp?'selected="selected"':'')+'>';
				time_option += tmp + '분</option>\n';
			}
			$("#lMinute").html(time_option);
		}
	}else{
		if(menu == "제주예약" && s_hour == jejuResEndHourNumber && s_min == 0){
			//dsBox('lHour','20');
			dsBox('lHour',jejuRtnEndHour);
			$('#lHour option[value="'+jejuRtnEndHourNumber+'"]').trigger('change');
		}else{
			dsBox('lHour',possSHour);
			$('#lHour option[value="'+possSHour+'"]').trigger('change');
		}
		$('#lHour').prop('disabled', true);
		if((menu == "제주예약" && s_hour > 20 && s_hour < jejuResEndHourNumber) || (menu == "내륙예약" && s_hour == 19 && s_min == 0)){
			$("#lMinute").val("00").trigger('change');
		}else{
			$("#lMinute").val(possSMin).trigger('change');
		}
	}
	
	var pSDate = $("#params_sDate").val();
	if(pSDate != "") {
		if(menu == "내륙예약"){
			$("div.store-area:eq(0)").find('span.fl').removeClass('is-disabled');
			$("#sHour,#lHour,#sMinute,#lMinute").prop("disabled", false);
			$('#branchId').val($("#params_branchId").val());
			$('#branchId2').val($("#params_branchId2").val());
			getPossTime();
			dsBox("sHour", $("#params_sHour").val());
			dsBox("lHour", $("#params_lHour").val());
		} else {
			setShortParams();
		}
	}
}

function infoClear(){
	var cls = $("#userClass").val(); 
	if(confirm("입력하신 정보를 모두 초기화하시겠습니까?\n입력하신 정보는 저장되지 않습니다.")){
		alert(corp);
		return;
		
		
		
		if($("#branchId").val() == '000012'){
			if(cls == '1') location.href = "/rent/rentcar/short_rent_reservation_new_jeju_company.do";
			else location.href = "/rent/rentcar/short_rent_reservation_new_jeju.do";
		}else{
			if(cls == '1') location.href = "/rent/rentcar/short_rent_reservation_new_company.do";
			else location.href = "/rent/rentcar/short_rent_reservation_new.do";
		}
	}
}

function dateValueTrd() {
	return dateValue() + "000";
}

function dateValue() {
	var time = new Date();
	return "" +time.getFullYear() + addZero(time.getMonth() + 1) + addZero(time.getDate()) +
		addZero(time.getHours()) + addZero(time.getMinutes()) + addZero(time.getSeconds());
}
function random_num(){
	var ran;
	ran = (Math.floor(Math.random()*9999))+1;	
	if(ran < 10){
		ran = "000"+ran;
	}else if(ran >= 10 && ran < 99){
		ran = "00"+ran;
	}else if(ran >= 100 && ran < 999){
	    ran = "0"+ran;
	}	
	return ran;
}


function nextPage(){//예약 페이지에서 다음 버튼 눌렀을 때 필수값 체크
	
	///예약등록
	var sDate = "";
	var lDate = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	
	$("#dptDtm").val(sDate + $("#sHour > option:selected").val() + $("#sMinute > option:selected").val());
	$("#arvDtm").val(lDate + $("#lHour > option:selected").val() + $("#lMinute > option:selected").val());
	
	var memId = $("#memId").val();
	
	var model = $("#carTypeName").val();
	if(model.substring(0,2) == "BE"){
		if($("[name=benzYn]").is(":checked")) $("#benzCd").val($("[name=benzYn]").val());
		else $("#benzCd").val("");
	}else{
		$("#benzCd").val("");
	}
	
	check = essCheck();
	
	if($("#branchId").val() == '000012'){
		try{
			console.log('차량ID='+model+', 차량명='+$("#modelNm").text()+', 벤츠 동의여부='+$("#benzCd").val()+', 면책제도종류='+$("#ldwId").val()+', 개인정보입력여부='+check);
			setUserSelectTrace(model, $("#modelNm").text(), $("#benzCd").val(), $("#ldwId").val(),check); //웹로그 정보 입력
		}catch(e){
			console.log("error : web setUserSelectTrace log 생성 오류");
		}
	}
	
	//차량손해면책제도 선택 체크
	 if($("#ldwId2").val() =='' || $("#ldwId2").val() == null){
		alert('차량손해면책제도를 선택해주세요.');
		$("html, body").animate({scrollTop: 1100 });
		return;
	}
	
	if($("#txtClosedBranch").css("display") != "none"){
		alert('예약기간을 확인해 주세요.');
		$("html, body").animate({scrollTop: 250 });
		return;
	}
	   
	if(check && hasNext){
		//이용약관 동의체크
		var term_checks = $('div.terms-listbox input:gt(0):checked').length;
		if(term_checks < 5){
			alert('이용약관을 동의하지 않으셨습니다. 이용약관을 미동의시 렌터카 서비스 이용이 불가능합니다.');
			var offset = $('div.terms-listbox').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			return false;
		}else{
			// 최종적으로 면허 번호를 체크
			var licenseType = $("[name=licenseType]").val();
			var licenseAvil = $("[name=licenseAvil]").val();
			var licenseNo = $("[name=licenseNo]").val();
			var userNm = $("[name=userNm]").val();
			var birthday = $("[name=birthday]").val();
			
			$.ajax({
				url : '/rent/rentcar/lcnsCheck.json',
				type : 'POST',
				dataType : 'json',
				data : {
						"channel":"DCOM",
						"licenseType" : licenseType,
						"licenseNo" : licenseNo,
						"userNm" : userNm,
						"birthday" : birthday
				},
				success : function(data) {
					console.log("CCCCCCCCC : ", data);
					
					if(data.LCNS_RTN_CD=="00"||data.LCNS_RTN_CD=="02"){
						
						$(':disabled').prop('disabled',false);
						$("#reservForm").attr("action","/rent/rentcar/short_rent_reservation_update_new.do?mode=RentProc");
						
						reserve_submit();
						
					}else{
						lcnResultMsg(data);
						setLcnsInput(false, false);
						return false;
					}
				}
			});
		}
		
	}
	else // 입력값이 부족할때
	{
		if ($("#sDate").val() == '')
		{
			alert('예약일을 선택하지 않으셨습니다.');
		}
		else if ($("#branchId").val() == '')
		{
			alert("대여 지점을 선택하지 않으셨습니다.");
		}
		else if($("#carTypeName").val() =='')
		{
			alert('대여차량을 선택하지 않으셨습니다.');
			var offset = $('#alert-cartype').offset();
			$("html, body").animate({scrollTop: offset.top-150}, 10);
		}
		else
		{
			alert('예약정보를 입력해주세요');
			var offset = $('[name=userNm]').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
		}
	}
}

var clickable = true;
function reserve_submit()
{
	$("#modal-terms-check a.btn-color1").removeClass("btn-color1").addClass("btn-color4");	
	$("#modal-terms-check").show();
	$('.dimd').show();
	
	//////////////////////////// 꼭읽어보세요. 팝업
	$("#modal-terms-check div.btn-box a").click(function(){		
		
		if (clickable)
		{
			clickable = false;
			$("input:disabled").prop('disabled',false);
			$("#reservForm").submit();
		}
	});

}
//나이 체크 
function ageCheck(age){
	var nd = new Date();
	var year = nd.getFullYear();
	var month = (nd.getMonth()+1)<10?"0"+(nd.getMonth()+1):(nd.getMonth()+1);
	var date = nd.getDate()<10?"0"+nd.getDate():nd.getDate();
	var std = year+""+month+""+date;
	var birthDayCheck = (Number(std)-Number($('[name=birthday]').val()) >= (age*10000));
	
	return birthDayCheck;
}

function companyReserve(){
	var sDate = "";
	var lDate = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	
	$("#dptDtm").val(sDate + $("#sHour > option:selected").val() + $("#sMinute > option:selected").val());
	$("#arvDtm").val(lDate + $("#lHour > option:selected").val() + $("#lMinute > option:selected").val());
	
	var memId = $("#memId").val();
	var model = $("#carTypeName").val();
	if(model.substring(0,2) == "BE"){
		if($("[name=benzYn]").is(":checked")) $("#benzCd").val($("[name=benzYn]").val());
		else $("#benzCd").val("");
	}else{
		$("#benzCd").val("");
	}
	
	check = essCheck();	
	
	
	if(check){
		$("#sDate,#lDate,#sHour,#lHour,#sMinute,#lMinute").prop("disabled", false);
		var reqData = $('#reservForm').serialize();
		
		$.ajax({
			type : "post",
			url : "/wps/PA_1_Q7JFDFH20G66902PJT4SHT24V6/rentcar/CorpRent/RentProc.json",
			data : reqData,
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				location.reload();
			},
			error : function(){
				alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
			} 
		});	
	}else{
		if ($("#sDate").val() == '')
		{
			alert('예약일을 선택하지 않으셨습니다.');
		}
		else if ($("#branchId").val() == '')
		{
			alert("대여 지점을 선택하지 않으셨습니다.");
		}
		else if($("#carTypeName").val() =='')
		{
			alert('대여차량을 선택하지 않으셨습니다.');
			var offset = $('#alert-cartype').offset();
			$("html, body").animate({scrollTop: offset.top-150}, 10);
		}
		else
		{
			alert('예약정보를 입력해주세요');
			var offset = $('[name=userNm]').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
		}
	}
}

//조건값이 true이면 span에 오류 메시지 출력. 리턴값은 무조건 false로 리턴
function spanAlert(alertSelector, msgSelector, offsetSelector, message)
{
	$(alertSelector).addClass("msg-alert");
	$(msgSelector).html(message);
	var offset = $(offsetSelector).offset();
	$("html, body").animate({scrollTop: offset.top-200}, 10);
	return false;			
}

function essCheck(){
	var check = true;
	var userClass = $("#userClass").val();
	
	var model = $("[name=model").val();
	var branchId = $("#branchId").val();
	var sDate = "";
	var lDate = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") sDate = dateFormat($('#sDate').val(),'',0);
	if($("#lDate").val()!= null && $("#lDate").val()!="") lDate = dateFormat($('#lDate').val(),'',0);
	
	sDate = sDate + $("#sHour > option:selected").val() + $("#sMinute > option:selected").val();
    lDate = lDate + $("#lHour > option:selected").val() + $("#lMinute > option:selected").val();
	var objDate = new Date(sDate.substr(0,4), sDate.substr(4,2)-1, sDate.substr(6,2), sDate.substr(8,2), sDate.substr(10,2));
	strWeek = objDate.getDay();
	
	var nd = new Date();
	var year = nd.getFullYear();
	var month = (nd.getMonth()+1)<10?"0"+(nd.getMonth()+1):(nd.getMonth()+1);
	var date = nd.getDate()<10?"0"+nd.getDate():nd.getDate();
	var std = year+""+month+""+date; 
	if(userClass != 1){
		var birthDayCheck = (Number(std)-Number($('[name=birthday]').val()) >= 210000);
		var licenseAvil = $('[name=licenseAvil]').val();
		var birthDay = $('[name=birthday]').val();
		
		var birthYr = birthDay.substring(0,4);
		var birthMn = birthDay.substring(4,6);
		var birthDt = birthDay.substring(6,8);
		
		var lcnsYr = licenseAvil.substring(0,4);
		var lcnsMn = licenseAvil.substring(4,6);
		var lcnsDt = licenseAvil.substring(6,8);
	console.log(lcnsYr+":"+lcnsMn+":"+lcnsDt);
	}
	
	var startDt = "";
	var endDt = "";
	if($("#sDate").val()!= null && $("#sDate").val()!="") startDt = dateFormat($('#sDate').val(),'',0);
	if($("#lDate").val()!= null && $("#lDate").val()!="") endDt = dateFormat($('#lDate').val(),'',0);
	 
	var userCls = $("#userClass").val();
	if(userCls != "1"){
		if( parseInt(licenseAvil) >= parseInt(20200223) && parseInt(licenseAvil) <= parseInt(20200630) ){
			licenseAvil = "20201231";
		}
		
		if ($('[name=licenseAvil]').val()=='' || $('[name=licenseAvil]').val().length < 8) {
			$("#alert-lcnsAvil").addClass("msg-alert");
			$("#span-lcnsAvil").html("적성검사 만료일을 입력해주세요.");
			var offset = $('[name=licenseAvil]').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			
			setLcnInputDisableClear();
			
			check = false;		
		}else if(parseInt(licenseAvil)<parseInt(startDt) || parseInt(licenseAvil)<parseInt(endDt)){
			$("#alert-lcnsAvil").addClass("msg-alert");
			$("#span-lcnsAvil").html("적성검사 만료일이 반납일 이후여야 예약 가능합니다.");
			var offset = $('[name=licenseAvil]').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			setLcnInputDisableClear();
			check = false;	
		}else if(lcnsMn > 12 || lcnsDt > 31 || lcnsMn == '00' || lcnsDt == '00'){
			$("#alert-lcnsAvil").addClass("msg-alert");
			$("#span-lcnsAvil").html("적성검사 만료일을 정확히 입력해주세요.");					
			var offset = $('[name=licenseAvil]').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			setLcnInputDisableClear();
			check = false;
		}
		
		if ($('[name=licenseNo]').val().length<12 ||$('[name=licenseNo]').val().length>12) {
			$("#alert-lcnsNo").addClass("msg-alert");
			$("#span-lcnsNo").html("면허번호를 입력해주세요.");
			var offset = $('[name=licenseNo]').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			setLcnInputDisableClear();
			check = false;
		}else if($('[name=licenseNo]').val().length == 12){
			var lcnsArea = $('[name=licenseNo]').val().substring(0,2);
			var areaFl = false;

			for(var i=0; i<areaArr.length;i++){
				if(areaArr[i] == lcnsArea) areaFl = true;
			}
			
			if(!areaFl){
				$("#alert-lcnsNo").addClass("msg-alert");
				$("#span-lcnsNo").html("면허번호를 정확히 입력해주세요.");
				var offset = $('[name=licenseNo]').offset();
				$("html, body").animate({scrollTop: offset.top-200}, 10);
				setLcnInputDisableClear();
				check = false;
			}
		}
		
		if($('[name=licenseType]').val()==''){
			$("#alert-lcnsType").addClass("msg-alert");
			$("#span-lcnsType").html("면허종류를 선택해주세요.");
			var offset = $('#licenseType').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			setLcnInputDisableClear();
			check =  false;
		}
		
		if ($('[name=homeZip]').val()=='' || $('[name=homeAddr]').val()=='') {
			$("#alert-addr").addClass("msg-alert");
			$("#span-addr").html("주소를 입력해주세요.");
			var offset = $('#addrSearchBtn').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			check = false;		
		}
		
		if ($('#licenseIssued').val()=='' || $('#licenseIssued').val().length<8) {
			$("#alert-lcnsIssued").addClass("msg-alert");
			$("#span-lcnsIssued").html("운전면허 발급일을 입력해주세요.");
			var offset = $('#licenseIssued').offset();
			$("html, body").animate({scrollTop: offset.top-200}, 10);
			check = false;		
		}else{
			if($("#span-lcnsIssued").html() != ""){
				var offset = $('#licenseIssued').offset();
				$("html, body").animate({scrollTop: offset.top-200}, 10);
				check = false;
			}
		}
	}
	
	if($("#ldwId").val() == "428001" && $("#ldwId").val() != "" && $.trim($("#branchId").val()) == "000012"){
		/*
		if($("#selCarType").val() != "6"){
			alert("제주지점 일반자차는 수입/전기 차량만 이용 가능합니다.");
			check =  false;
		}
		*/
	}else if($("#ldwId").val() == "428003" && $("#ldwId").val() == "428004" && $("#ldwId").val() != "" &&  $.trim($("#branchId").val()) == "000012"){
		if($("#selCarType").val() == "6"){
			//alert("제주지점 일반자차는 수입/전기 차량만 이용 가능합니다.");
			alert("제주지점 완전 자차, SUPER 자차는 수입/전기 차량은 이용 가능하지 않습니다.");
			check =  false;
		}
	}

	//이메일 필수 해제
	//if($("[name=email]").val()==""){
	//	check = spanAlert("#alert-email", "#span-email", "[name=emailId]", "이메일을 입력해주세요.");
	//}
	
	var regExpHp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if($("[name=mobile]").val()==""){
		check = spanAlert("#alert-mobile", "#span-mobile", "[name=mobile]", "휴대폰 번호를 입력해주세요.");
	}else if($("[name=mobile]").val().length < 10){
		check = spanAlert("#alert-mobile", "#span-mobile", "[name=mobile]", "띄어쓰기 없이 10자 이상의 숫자만 입력 가능합니다.");
	}else if( !regExpHp.test($('[name=mobile]').val()) ) {
		check = spanAlert("#alert-mobile", "#span-mobile", "[name=mobile]", "휴대폰번호를 입력해주세요.");
	}
	
	if(userClass != 1){
		if($("[name=birthday]").val()==""||($("[name=birthday]").val().length<8)){
			check = spanAlert("#alert-birth", "#span-birth", "[name=birthday]", "생년월일을 입력해주세요.");
		}else if(!birthDayCheck){
			check = spanAlert("#alert-birth", "#span-birth", "[name=birthday]", "만 21세이상부터 예약 가능합니다.");
		}else if(birthMn > 12 || birthDt > 31 || birthMn == "00" || birthDt == "00"){
			check = spanAlert("#alert-birth", "#span-birth", "[name=birthday]", "생년월일을 정확히 입력해주세요.");
		}	
	}

	if($("[name=userNm]").val()==""){
		check = spanAlert("#alert-name", "#span-name", "[name=userNm]", "이름을 입력해주세요.");
	}
	
	if($.trim($("#carTypeName").val()) == "" ){
		check = spanAlert("#alert-cartype", "#span-cartype", "#carTypeName", "대여차량을 선택해주세요.");
	}

	if($.trim($("#branchId").val()) == "" ){
		check = spanAlert("#alert-branch", "#span-branch", "#div_store_area1", "대여지점을 선택해주세요.");
	}
	
	if($.trim($("#lDate").val()) == "" ){
		check = spanAlert("#alert-lDate", "#span-lDate", "#lDate", "반납일시를 선택해주세요.");
	}
	
	if($.trim($("#sDate").val()) == ""){
		check = spanAlert("#alert-sDate", "#span-sDate","#sDate", "대여일시를 선택해주세요.");
	}
	
	if(userCls != "1"){
		if(check)
			check = hasNext;
	}
	
	return check;
}

function essentialCheck(){
	var userClass = $("#userClass").val();
console.log("essentialCheck() 실행"+userClass);
	
	if(
			($("[name=userNm]").val() != "" && $("[name=userNm]").val() != null) 
			&&($("[name=mobile]").val() != "" && $("[name=mobile]").val() != null && $("[name=mobile]").val().length >= 10)
			//&&($("[name=email]").val() != "" && $("[name=email]").val() != null) //이메일 필수 해제
			&&($("[name=sDate]").val() != "" && $("[name=sDate]").val() != null) 
			&&($("[name=lDate]").val() != "" && $("[name=lDate]").val() != null)
			&&($("[name=cdId]").val() != "" && $("[name=cdId]").val() != null)
			&&($("[name=cdId2]").val() != "" && $("[name=cdId2]").val() != null)
			&&($("[name=branchId]").val() != "" && $("[name=branchId]").val() != null)
			&&($("[name=branchId2]").val() != "" && $("[name=branchId2]").val() != null)
			&&($("[name=carTypeName]").val() != "" && $("[name=carTypeName]").val() != null)
		){
		
		if(userClass != 1){//회원, 비회원
			if(userClass == 0 && $("#ldwId").val() == "428004"){//회원이고 제주도이고 자차손채면책보상수수료가 완전자차일 때
console.log("회원 제주도 완전자차"+birthFlag+":"+lcnsAvilFlag);
				if(($("[name=birthday]").val() != "" && $("[name=birthday]").val() != null && $("[name=birthday]").val().length == 8 && birthFlag)
					&& ($("[name=homeZip]").val() != "" && $("[name=homeZip]").val() != null)
					&& ($("[name=homeAddr]").val() != "" && $("[name=homeAddr]").val() != null)
					&& ($("[name=homeDtlAddr]").val() != "" && $("[name=homeDtlAddr]").val() != null)
					&& ($("[name=licenseType]").val() != "" && $("[name=licenseType]").val() != null)
					&& ($("[name=licenseNo]").val() != "" && $("[name=licenseNo]").val() != null && $("[name=licenseNo]").val().length == 12)
					&& ($("[name=licenseAvil]").val() != "" && $("[name=licenseAvil]").val() != null && $("[name=licenseAvil]").val().length == 8 && lcnsAvilFlag)){
console.log("성공");				
					$("#noBtn").hide();
					$("#nextBtn").show();
				}else{
console.log("실패");					
					$("#nextBtn").hide();
					$("#noBtn").show();
				}
			}else{
console.log("제주도 완전자차 제외");
				if(($("[name=birthday]").val() != "" && $("[name=birthday]").val() != null && $("[name=birthday]").val().length == 8 && birthFlag)){
console.log("생일 성공");		
					$("#noBtn").hide();
					$("#nextBtn").show();
				}else{
console.log("생일 실패");
					$("#nextBtn").hide();
					$("#noBtn").show();
				}
			}
		}else{
			$("#noBtn").hide();
			$("#nextBtn").show();
			$("#noCorpRserve").hide();
			$("#goCorpRserve").show();
		}
	}else{
		$("#nextBtn").hide();
		$("#noBtn").show();
		$("#goCorpRserve").hide();
		$("#noCorpRserve").show();
	}
}

function ldwAbleCheck(){
	console.log("ldwAbleCheck 실행");	
	var branchCd = $("[name=branchId]").val();
	var carTypeCd = $("[name=carTypeName]").val();
	var selCarCd = $("#selCarCd").val();
	var dcCardId = $("#dcCardId").val();
	var corpNm = $("#corpNm").val();
	
	if(($("[name=sDate]").val() != "" && $("[name=sDate]").val() != null) 
			&&($("[name=lDate]").val() != "" && $("[name=lDate]").val() != null)
			&&($("[name=cdId]").val() != "" && $("[name=cdId]").val() != null)
			&&($("[name=cdId2]").val() != "" && $("[name=cdId2]").val() != null)
			&&($("[name=branchId]").val() != "" && $("[name=branchId]").val() != null)
			&&($("[name=branchId2]").val() != "" && $("[name=branchId2]").val() != null)
			&&($("[name=carTypeName]").val() != "" && $("[name=carTypeName]").val() != null)){
		console.log("ldw 활성화");		

		$("#vipLdwList").hide(); // vip 면책제도 설정

		if( selCarCd == "232009" && branchCd == "000012"){//원래 carTypeCd.substring(0,2) == "BE" && branchCd == "000012"
			$("#noLdwList,#ldwList,#benz_ldw_no").hide();
			$("#benz_ldw").show();
			//$("#benz_ldw_no,#benz_ldw,#noLdwList,#volt-ldw,.import-ldw").hide();
			//$("#ldwList,#normal-ldw,.inland-ldw").show();		
//			$("#benz_ldw li a").eq(0).trigger("click");
		}else if(carTypeCd == "DW1602" && branchCd == "000012"){//제주지점 볼트EV면 완전자차 선택 불가처리 //DW1602 = 볼트EV normal-ldw volt-ldw
			$("#benz_ldw_no,#benz_ldw,#noLdwList,#normal-ldw").hide();
			$("#ldwList,#volt-ldw").show();
//			$("#ldwList li a").eq(0).trigger("click");
		}else if(branchCd != "000012" && $("#selCarType").val() == "6"){//내륙이고 수입차량일 때
			if($("#branchAir").val() == "N"){
				$("#noLdwList,.inland-ldw").hide();
				$("#ldwList,.air-ldw").hide();
				$("#ldwList,.import-ldw").show();
			}else{
				$("#noLdwList,.inland-ldw").hide();
				$("#ldwList,.import-ldw").hide();
				$("#ldwList,.air-ldw").show();
			}
//			$("#ldwList li a").eq(0).trigger("click");
		}else if( dcCardId == "P00000028232" || corpNm == "vip" ){
			$("#noLdwList,#ldwList,#benz_ldw,#benz_ldw_no").hide();
			$("#vipLdwList").show();
			$("#vipLdwList li a").eq(0).trigger("click");
		}else{
			$("#benz_ldw_no,#benz_ldw,#noLdwList,#volt-ldw,.import-ldw,.air-ldw").hide();
			$("#ldwList,#normal-ldw,.inland-ldw").show();			
//			$("#ldwList li a").eq(0).trigger("click");
		}
	}else{
		console.log("ldw 비활성화");
		$(".through_line_span").hide();
		if( selCarCd == "232009"  && branchCd == "000012"){//제주지점 벤츠 이벤트 (원래 carTypeCd.substring(0,2) == "BE" && branchCd == "000012")
			/*
			$("#noLdwList").hide();
			$("#ldwList").hide();
			$("#vipLdwList").hide();
			
			$("#benz_ldw_no").show();
			$("#benz_ldw").hide();
			*/
			$("#benz_ldw_no").hide();
			$("#benz_ldw").hide();
			
			$("#ldwList").hide();
			$("#vipLdwList").hide();
			$("#noLdwList").show();
			$("#noLdwList li").on('click', function(e){
				e.preventDefault();
			});
		}else{
			$("#benz_ldw_no").hide();
			$("#benz_ldw").hide();
			
			$("#ldwList").hide();
			$("#vipLdwList").hide();
			$("#noLdwList").show();
			$("#noLdwList li").on('click', function(e){
				e.preventDefault();
			});
		}
	}
}

//[S]값 체크[S]//
var birthFlag = true;
var lcnsAvilFlag = true;

function checkingName(){ //이름에 숫자 못 들어가도록 체크
	var checkedValue = $("[name=userNm]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=userNm]").val("");
		}else{
			$("[name=userNm]").val(checkedValue.trim());
		}
	}
	
	if(checkedLength != 0){
		if(!noNumberKey()){
			if(checkedLength == 1){
				$("[name=userNm]").val("");
			}else{
				$("[name=userNm]").val(checkedValue.substring(0,checkedLength-1));
			}
		}else{
			if(checkedLength > 20){
				$("[name=userNm]").val(checkedValue.substring(0,20));
			}else{
				$("#alert-name").removeClass("msg-alert");
				$("#span-name").html("");
			}
		}
	}else{
		$("#alert-name").addClass("msg-alert");
		$("#span-name").html("이름을 입력해주세요.");
	}
}
function checkingBirth(){//생일에 문자 못 들어가도록 체크, 성인 체크
	var num_pattern = /^[0-9]+$/;//숫자패턴
	var checkedValue = $("[name=birthday]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=birthday]").val("");
		}else{
			$("[name=birthday]").val(checkedValue.trim());
		}
	}
	
	var nd = new Date();
	var year = nd.getFullYear();
	var month = (nd.getMonth()+1)<10?"0"+(nd.getMonth()+1):(nd.getMonth()+1);
	var date = nd.getDate()<10?"0"+nd.getDate():nd.getDate();
	var std = year+""+month+""+date;
	var birthDayCheck = (Number(std)-Number($('[name=birthday]').val()) >= 210000);
	
	if(checkedLength != 0){
		if(!num_pattern.test(checkedValue)){
			if(checkedLength == 1){
				$("[name=birthday]").val("");
			}else{
				$("[name=birthday]").val(checkedValue.substring(0,checkedLength-1));
			}
			birthFlag = false;
		}else{
			if(checkedLength == 8){
				var birthYr = checkedValue.substring(0,4);
				var birthMn = checkedValue.substring(4,6);
				var birthDt = checkedValue.substring(6,8);
				
	console.log(birthYr+"-"+birthMn+"-"+birthDt);			

				if(birthMn > 12 || birthDt > 31 || birthMn == '00' || birthDt == '00'){
					$("#alert-birth").addClass("msg-alert");
					$("#span-birth").html("생년월일을 정확히 입력해주세요.");
					$("[name=birthday]").focus();
					birthFlag = false;
					return false;
				}else{
					if(!birthDayCheck){//성인체크
						$("#alert-birth").addClass("msg-alert");
						$("#span-birth").html("만 21세이상부터 예약 가능합니다.");
						$("[name=birthday]").focus();
						birthFlag = false;
						return false;
					}else{
						$("#alert-birth").removeClass("msg-alert");
						$("#span-birth").html("");
						birthFlag = true;
					}	
				}
			}else if(checkedLength > 8){
				$("[name=birthday]").val(checkedValue.substring(0,8));
				
				var birthYr = $("[name=birthday]").val().substring(0,4);
				var birthMn = $("[name=birthday]").val().substring(4,6);
				var birthDt = $("[name=birthday]").val().substring(6,8);
				
				if(birthMn > 12 || birthDt > 31 || birthMn == '00' || birthDt == '00'){
					$("#alert-birth").addClass("msg-alert");
					$("#span-birth").html("생년월일을 정확히 입력해주세요.");
					$("[name=birthday]").focus();
					birthFlag = false;
					return false;
				}else{
					if(!birthDayCheck){//성인체크
						$("#alert-birth").addClass("msg-alert");
						$("#span-birth").html("만 21세이상부터 예약 가능합니다.");
						$("[name=birthday]").focus();
						birthFlag = false;
						return false;
					}else{
						$("#alert-birth").removeClass("msg-alert");
						$("#span-birth").html("");
						birthFlag = true;
					}	
				}
				
			}else if(checkedLength < 8){
				$("#alert-birth").addClass("msg-alert");
				$("#span-birth").html("생년월일을 정확히 입력해주세요.");
				$("[name=birthday]").focus();
				birthFlag = false;
				return false;
			}else if(checkedLength == 8){
				$("#alert-birth").removeClass("msg-alert");
				$("#span-birth").html("");
				birthFlag = true;
			}
		}
	}else{
		$("#alert-birth").addClass("msg-alert");
		$("#span-birth").html("생년월일을 입력해주세요.");
	}
	
	console.log("birthFlag="+birthFlag);
}
function checkingHP(){
	var num_pattern = /^[0-9]+$/;//숫자패턴
	var checkedValue = $("[name=mobile]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=mobile]").val("");
		}else{
			$("[name=mobile]").val(checkedValue.trim());
		}
	}
	if(checkedLength != 0){	
		if(!num_pattern.test(checkedValue)){
			if(checkedLength == 1){
				$("[name=mobile]").val("");
			}else{
				$("[name=mobile]").val(checkedValue.substring(0,checkedLength-1));
			}
		}else{
			var regExpHp = /^01([0|1|6|7|8|9]?)$/g;
			//var regExpHp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			var seNum = checkedValue.substring(0,3);
			
			if(seNum.length == 1 && seNum != "0"){
				$("[name=mobile]").val("");
			}else if(seNum.length < 3 && !regExpHp.test(seNum)){
				$("[name=mobile]").val(checkedValue.substring(0,1));
			}else if(seNum.length < 4 && !regExpHp.test(seNum)){
				$("[name=mobile]").val(checkedValue.substring(0,2));
			}else if(checkedLength > 11){
				$("[name=mobile]").val(checkedValue.substring(0,11));
			}else if(checkedLength <= 11 && checkedLength >= 10){
				$("#alert-mobile").removeClass("msg-alert");
				$("#span-mobile").html("");
			}
		}
	}else{
		$("#alert-mobile").addClass("msg-alert");
		$("#span-mobile").html("휴대폰 번호를 입력해주세요.");
	}
}
function checkingEmailId(){
	var pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;//한글패턴
	var checkedValue = $("[name=emailId]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=emailId]").val("");
		}else{
			$("[name=emailId]").val(checkedValue.trim());
		}
	}
	
	if(checkedLength != 0){
		if(pattern.test(checkedValue)){
			if(length == 1){
				$("[name=emailId]").val("");
			}else{
				$("[name=emailId]").val(checkedValue.substring(0,checkedLength-1));
			}
		}else{
			if(checkedLength > 30){
				$("[name=emailId]").val(checkedValue.substring(0,30));
			}else{
				if(checkedValue != "" && $("[name=domain]").val() != ""){
					$("#alert-email").removeClass("msg-alert");
					$("#span-email").html("");
				}
			}
		}
	}else{
		//이메일 필수 해제
		//$("#alert-email").addClass("msg-alert");
		//$("#span-email").html("이메일을 입력해주세요.");
	}
}
function checkingEmailDomain(){
	var pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var checkedValue = $("[name=domain]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=domain]").val("");
		}else{
			$("[name=domain]").val(checkedValue.trim());
		}
	}
	
	if(checkedLength != 0){
		if(pattern.test(checkedValue)){
			if(length == 1){
				$("[name=domain]").val("");
			}else{
				$("[name=domain]").val(checkedValue.substring(0,checkedLength-1));
			}
		}else{
			if(checkedLength > 30){
				$("[name=domain]").val(checkedValue.substring(0,30));
			}else{
				if(checkedValue != "" && $("[name=emailId]").val() != ""){
					$("#alert-email").removeClass("msg-alert");
					$("#span-email").html("");
				}
			}
		}
	}else{
		//이메일 필수 해제
		//$("#alert-email").addClass("msg-alert");
		//$("#span-email").html("이메일을 입력해주세요.");
	}	
}

function checkingDtlAddr(){
	var checkedValue = $("[name=homeDtlAddr]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=homeDtlAddr]").val("");
		}else{
			$("[name=homeDtlAddr]").val(checkedValue.trim());
		}
	}
	
	if(checkedLength > 30){
		$("[name=homeDtlAddr]").val(checkedValue.substring(0,30));
	}
}

var areaArr = ["서울", "11", "부산", "12", "대구", "22", "인천", "23", "광주", "24", "대전", "25", "울산", "26", "경기", "13"
               ,"강원", "14", "충북", "15", "충남", "16", "전북", "17", "전남", "18", "경북", "19", "경남", "20", "제주", "21", "28"];
function checkingLicenseNo(){
	var userCls = $("#userClass").val();
	var ldwId = $("#ldwId").val();
	var pattern = /[a-z]|[ \[\]{}()<>?|`~!@#$%^&\*\-\_+=,.;:\"'\\]/g;;//한글과 숫자만
	//var pattern = /[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]/gi; //특수문자 패턴
	var checkedValue = $("[name=licenseNo]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=licenseNo]").val("");
		}else{
			$("[name=licenseNo]").val(checkedValue.trim());
		}
	}
	if(checkedLength != 0){
		if(pattern.test(checkedValue)){
			if(checkedLength == 1){
				$("[name=licenseNo]").val("");
			}else{
				$("[name=licenseNo]").val(checkedValue.substring(0,checkedLength-1));
			}
		}else{
			if(checkedLength > 12){
				$("[name=licenseNo]").val(checkedValue.substring(0,12));
				var lcnsArea = checkedValue.substring(0,2);
				var areaFl = false;

				for(var i=0; i<areaArr.length;i++){
					if(areaArr[i] == lcnsArea) areaFl = true;
				}
				
				if(!areaFl){
					$("#alert-lcnsNo").addClass("msg-alert");
					$("#span-lcnsNo").html("면허번호를 정확히 입력해주세요.");
				}else{
					$("#alert-lcnsNo").removeClass("msg-alert");
					$("#span-lcnsNo").html("");
				}

			}else if(checkedLength == 12){
				var lcnsArea = checkedValue.substring(0,2);
				var areaFl = false;

				for(var i=0; i<areaArr.length;i++){
					if(areaArr[i] == lcnsArea) areaFl = true;
				}
				
				if(!areaFl){
					$("#alert-lcnsNo").addClass("msg-alert");
					$("#span-lcnsNo").html("면허번호를 정확히 입력해주세요.");
				}else{
					$("#alert-lcnsNo").removeClass("msg-alert");
					$("#span-lcnsNo").html("");
				}
			}
		}
	}else{
		if(userCls == 0 && ldwId == "428004"){
			$("#alert-lcnsNo").addClass("msg-alert");
			$("#span-lcnsNo").html("면허번호를 입력해주세요.");
		}
	}
}
function checkingLicenseAvil(){
	var userCls = $("#userClass").val();
	var ldwId = $("#ldwId").val();
	var num_pattern = /^[0-9]+$/;//숫자패턴
	var checkedValue = $("[name=licenseAvil]").val();
	var checkedLength = checkedValue.length;
	var char_ASCII = event.keyCode;
	if(char_ASCII == 32){
		if(checkedLength == 1){
			$("[name=licenseAvil]").val("");
		}else{
			$("[name=licenseAvil]").val(checkedValue.trim());
		}
	}
	
	var startDate = dateFormat('','',0);
	var endDate = dateFormat('','',0);
	if($("#sDate").val()!= null && $("#sDate").val()!="") startDate = dateFormat($('#sDate').val(),'',0);
	if($("#lDate").val()!= null && $("#lDate").val()!="") endDate = dateFormat($('#lDate').val(),'',0);
	
	if(checkedLength != 0){
		if(!num_pattern.test(checkedValue)){
			if(checkedLength == 1){
				$("[name=licenseAvil]").val("");
			}else{
				$("[name=licenseAvil]").val(checkedValue.substring(0,checkedLength-1));
			}
			lcnsAvilFlag = false;
		}else{
			if(checkedLength == 8){
				var lcnsYr = checkedValue.substring(0,4);
				var lcnsMn = checkedValue.substring(4,6);
				var lcnsDt = checkedValue.substring(6,8);
				//console.log(lcnsYr+":"+lcnsMn+":"+lcnsDt);			

				if(lcnsMn > 12 || lcnsDt > 31 || lcnsMn == '00' || lcnsDt == '00'){
					$("#alert-lcnsAvil").addClass("msg-alert");
					$("#span-lcnsAvil").html("적성검사 만료일을 정확히 입력해주세요.");					
					lcnsAvilFlag = false;
				}else{
					if( parseInt(checkedValue) >= parseInt(20200223) && parseInt(checkedValue) <= parseInt(20200630) ){
						checkedValue = "20201231";
					}
					if(parseInt(checkedValue)<parseInt(startDate) || parseInt(checkedValue)<parseInt(endDate)){
						$("#alert-lcnsAvil").addClass("msg-alert");
						$("#span-lcnsAvil").html("적성검사 만료일이 반납일 이후여야 예약 가능합니다.");
						lcnsAvilFlag = false;
					}else{
						$("#alert-lcnsAvil").removeClass("msg-alert");
						$("#span-lcnsAvil").html("");
						lcnsAvilFlag = true;
					}
				}
			}else if(checkedLength > 8){
				$("[name=licenseAvil]").val(checkedValue.substring(0,8));
			}else if(checkedLength < 8 && checkedLength != 0){
				$("#alert-lcnsAvil").addClass("msg-alert");
				$("#span-lcnsAvil").html("적성검사 만료일을 정확히 입력해주세요.");
				lcnsAvilFlag = false;
			}else{
				$("#alert-lcnsAvil").removeClass("msg-alert");
				$("#span-lcnsAvil").html("");
				lcnsAvilFlag = true;
			}
		}
	}else{
		if(userCls == 0 && ldwId == "428004"){
			$("#alert-lcnsAvil").addClass("msg-alert");
			$("#span-lcnsAvil").html("적성검사 만료일을 입력해주세요.");
		}
	}
}

//운전면허 발급일 체크
function checkingLicenseIssued(){
	var num_pattern = /^[0-9]+$/;//숫자패턴
	var checkedValue = $("[name=licenseIssued]").val();
	var checkedLength = checkedValue.length;
	var sDate = $("#sDate").val();
	var licenseNo = $("[name=licenseNo]").val();
	
	if(checkedLength != 0){
		if(!num_pattern.test(checkedValue)){
			if(checkedLength == 1){
				$("[name=licenseIssued]").val("");
			}else{
				$("[name=licenseIssued]").val(checkedValue.substring(0,checkedLength-1));
			}
		}else{
			if(checkedLength == 8){
				var lcnsYr = checkedValue.substring(0,4);
				var lcnsMn = checkedValue.substring(4,6);
				var lcnsDt = checkedValue.substring(6,8);

				if(lcnsMn > 12 || lcnsDt > 31 || lcnsMn == '00' || lcnsDt == '00'){
					$("#alert-lcnsIssued").addClass("msg-alert");
					$("#span-lcnsIssued").html("운전면허 발급일을 정확히 입력해주세요.");				
				}else{
					if(licenseNo != "" && licenseNo != null){
						var sDateYear = parseInt(sDate.toString().substring(2,4));	
						var lcncNoYear = parseInt(licenseNo.toString().substring(2,4));
						
						if(lcncNoYear > sDateYear){
							$("#alert-lcnsIssued").removeClass("msg-alert");
							$("#span-lcnsIssued").html("");
						} else if(lcncNoYear == sDateYear){
							if(hasCDVal > 0){ //11인승이상
								$("#alert-lcnsIssued").addClass("msg-alert");
								$("#span-lcnsIssued").html("운전면허 발급일이 대여일보다 3년 이전이어야 예약 가능합니다.");
							}else if($("#selCarCd").val() == "232009"){ //수입차
								$("#alert-lcnsIssued").addClass("msg-alert");
								$("#span-lcnsIssued").html("운전면허 발급일이 대여일보다 3년 이전이어야 예약 가능합니다.");
							}else{
								$("#alert-lcnsIssued").addClass("msg-alert");
								$("#span-lcnsIssued").html("운전면허 발급일이 대여일보다 1년 이전이어야 예약 가능합니다.");			
							}
						} else {
							if(sDate != "" && sDate != null){
								sDate = dateFormat(sDate,'',0);
								var licenseIssuedDate = new Date(checkedValue.substring(0,4), Number(checkedValue.substring(4,6)-1), checkedValue.substring(6,8));
								var startDate = new Date(sDate.substring(0,4), Number(sDate.substring(4,6)-1), sDate.substring(6,8));
								var betweenDay = (startDate.getTime() - licenseIssuedDate.getTime())/1000/60/60/24;
		
								console.log("## test : " + betweenDay);
								if(betweenDay <= 366 && hasCDVal == 0 && $("#selCarCd").val() != "232009" && (lcncNoYear == sDateYear || lcncNoYear == (sDateYear-1))){
									$("#alert-lcnsIssued").addClass("msg-alert");
									$("#span-lcnsIssued").html("운전면허 발급일이 대여일보다 1년 이전이어야 예약 가능합니다.");
								}else if(hasCDVal > 0 && betweenDay <= 1096 && (lcncNoYear == sDateYear || lcncNoYear == (sDateYear-1) || lcncNoYear == (sDateYear-2) || lcncNoYear == (sDateYear-3))){ //11인승이상
									$("#alert-lcnsIssued").addClass("msg-alert");
									$("#span-lcnsIssued").html("운전면허 발급일이 대여일보다 3년 이전이어야 예약 가능합니다.");
								}else if($("#selCarCd").val() == "232009" && betweenDay <= 1096 && (lcncNoYear == sDateYear || lcncNoYear == (sDateYear-1) || lcncNoYear == (sDateYear-2) || lcncNoYear == (sDateYear-3))){ //수입차
									$("#alert-lcnsIssued").addClass("msg-alert");
									$("#span-lcnsIssued").html("운전면허 발급일이 대여일보다 3년 이전이어야 예약 가능합니다.");
								}else{
									$("#alert-lcnsIssued").removeClass("msg-alert");
									$("#span-lcnsIssued").html("");			
								}
							}else{
								$("#alert-lcnsIssued").removeClass("msg-alert");
								$("#span-lcnsIssued").html("");	
							}						
						}
					}else{
						$("#alert-lcnsIssued").removeClass("msg-alert");
						$("#span-lcnsIssued").html("");	
					}
				}
			}else if(checkedLength > 8){
				$("[name=licenseIssued]").val(checkedValue.substring(0,8));
			}else if(checkedLength < 8 && checkedLength != 0){
				$("#alert-lcnsIssued").addClass("msg-alert");
				$("#span-lcnsIssued").html("운전면허 발급일을 정확히 입력해주세요.");
			}else{
				$("#alert-lcnsIssued").removeClass("msg-alert");
				$("#span-lcnsIssued").html("");
			}
		}
	}
}

function changeLcnCheckData(){
	if($("[name=licenseAvil]").val().length == 8){
		checkLicenseInput11();
	}
}

function fn_cancel(url){	
	if(confirm("단기렌터카 예약을 취소하시겠습니까?\n취소 시 입력하신 내용은 저장되지 않습니다.")){
		location.href = url;
	}
}

function infoClear(){
	var userClass = $("#userClass").val();
	var dcCardId = $("#dcCardId").val();
	
	if(confirm("입력하신 정보를 모두 초기화하시겠습니까?\n입력하신 정보는 저장되지 않습니다.")){
		if(dcCardId == 'P00000028088' || dcCardId == ''){//닷컴
			if($("#branchId").val() == '000012'){
				if(userClass == '1') location.href = "/rent/rentcar/short_rent_reservation_new_jeju_company.do";
				else location.href = "/rent/rentcar/short_rent_reservation_new_jeju.do";
			}else{
				if(userClass == '1') location.href = "/rent/rentcar/short_rent_reservation_new_company.do";
				else location.href = "/rent/rentcar/short_rent_reservation_new.do";
			}
		}else{//제휴
			if($("#branchId").val() == '000012'){
				location.href = "/rent/frame/wps/reservation.do";
			}else{
				location.href = "/rent/frame/wps/reservation_inland.do";
			}
		}
	}
}



//[E]값 체크[E]//
$(function(){
	$("#benz_check").hide();
	$("#benz_ldw_no").hide();
	$("#benz_ldw").hide();
	$("#ldwList").hide();
	$("#vipLdwList").hide();
	$("#volt-ldw").hide();
	$(".import-ldw").hide();
	
	var userClass = "";
	if($("#userClass").val() != "" && $("#userClass").val() != null) userClass = $("#userClass").val();

	$('#select-personal').click(function() { //개인클릭시
		$("#userCls").val("0");
		$("#userId").val("");
		$("#passwd").val("");		
	});
	$('#select-company').click(function() { //법인클릭시
		$("#userCls").val("1");
		$("#userId").val("");
		$("#passwd").val("");		
	});	
	
	init();
	//essentialCheck();
	
	
	
	$("#cancelBtn").on('click', function(){
		if(confirm("단기렌터카 예약을 취소하시겠습니까?\n취소 시 입력하신 내용은 저장되지 않습니다.")){
			location.href = "/rent/rentcar/short_rent_reservation_new_jeju.do";
		}
	});
	
	// 시간 변경시 분 초기화 (20시면 00분만 선택 가능하게)
	$('.hour').change(function(){
		ldwAbleCheck();//자차면책금 활성화 비활성화 체크
		
		var sDate = dateFormat($('#sDate').val(),'',0);
		var lDate = dateFormat($('#lDate').val(),'',0);
		
		var TMP_SDATE = sDate +$('#sHour').val()+$('#sMinute').val();
		var TMP_LDATE = lDate +$('#lHour').val()+$('#lMinute').val();
		
		var current_nextDate = parseInt(current_date)+1;
		
		if($(this).attr('id')=='sHour'){
			console.log("1-1. 대여 시간을 변경했을 때");
			var chekLastHour = "0"; //20171228 대여가능시간 변경
			
//			if($.trim($("#reservMenu .selected").text()) == "내륙예약") chekLastHour = "19" ;
//			else if($.trim($("#reservMenu .selected").text()) == "제주예약") chekLastHour = jejuResEndHour;
			
			if($.trim($("#reservMenu .selected").text()) == "제주예약") {
				chekLastHour = jejuResEndHour;
				
				if($("#sHour").val() == chekLastHour){  //20171228 대여가능시간 변경  !!!!!
					$("#sMinute").html('<option value="00" selected="selected">00분</option>');
					$("#sMinute").prop("disabled", true);
				}else if( (sDate == current_date || sDate == current_nextDate) && $("#sHour").val() == shourFlag && sMinFlag == 30 ){
					console.log("close~!!!");
					$("#sMinute").html('<option value="30">30분</option>');
					$("#sMinute").prop("disabled", false);
				}else{
					$("#sMinute").prop("disabled", false);
					var time_option = "";
					for(var i = 0; i<=30; i+=30){
						var tmp = i<10?"0"+i:i;
						time_option += '<option value="'+tmp+'" '+($("#sMinute").val()==tmp?'selected="selected"':'')+'>';
						time_option += tmp + '분</option>\n';
					}
					$("#sMinute").html(time_option);
					console.log("대여3");
				}	
			} else {
				setInlandTime("sDate");
			}
			
			getCar();
		}else{
			console.log("1-2. 반납 시간을 변경했을 때");
			if($.trim($("#reservMenu .selected").text()) == "제주예약") {
				var chekLastHour = "0"; //20171228 대여가능시간 변경
				if($.trim($("#reservMenu .selected").text()) == "내륙예약") chekLastHour = gChekInlandLHour;
				else if($.trim($("#reservMenu .selected").text()) == "제주예약") chekLastHour = jejuRtnEndHour;
				
				if($("#lHour").val() == chekLastHour ){  //20171228 대여가능시간 변경 
					$("#lMinute").html('<option value="00" selected="selected">00분</option>');
					//$("#lMinute option[value=00]").prop("selected", true);
					$("#lMinute").prop("disabled", true);
				}else{
					$("#lMinute").prop("disabled", false);
				}
				
				getPossLtime($('#lDate'));
			} else {
				setInlandTime("lDate");
				getCar();
			}
		}

		if(TMP_SDATE.length==12){
			if($('#sDate').val() != null && $('#sDate').val() != '') $('#s_date_end').html($('#sDate').val() +" "+$('#sHour').val()+"시 "+$('#sMinute').val()+"분 ");
		}else{
			$('#s_date_end').html('');
		}
		if(TMP_LDATE.length==12){
			if($('#lDate').val() != null && $('#lDate').val() != '') $('#e_date_end').html($('#lDate').val() +" "+$('#lHour').val()+"시 "+$('#lMinute').val()+"분 ");
		}else{
			$('#l_date_end').html('');
		}
		selHourFlag = false;
		
		console.log( "selHourFlag : ", selHourFlag );
		if(selHourFlag == false){
			chkRentTerm();//24시간 이상 이하 확인
		}
		
		if($.trim($("#reservMenu .selected").text()) == "내륙예약"){
			getBranchList();
		}
	});
	
	$('.timeChange').change(function(){
		//checkAlert();
		ldwAbleCheck();//자차면책금 활성화 비활성화 체크
		if(selMinFlag == false){
			chkRentTerm();//24시간 이상 이하 확인
		}
		
		if($('#lMinute').val()==''){
			$('#lMinute option').removeAttr('selected');
			$('#lMinute option').eq(1).attr('selected',true);
		}
		if($('#sMinute').val()==''){
			$('#sMinute option').removeAttr('selected');
			$('#sMinute option').eq(1).attr('selected',true);
		}
		
		var sDate = dateFormat($('#sDate').val(),'',0);
		var lDate = dateFormat($('#lDate').val(),'',0);
		
		var TMP_SDATE = sDate +$('#sHour').val()+$('#sMinute').val();
		var TMP_LDATE = lDate +$('#lHour').val()+$('#lMinute').val();

		if(TMP_SDATE.length==12){
			if($('#sDate').val() != null && $('#sDate').val() != '') $('#s_date_end').html($('#sDate').val() +" "+$('#sHour').val()+"시 "+$('#sMinute').val()+"분 ");
		}else{
			$('#s_date_end').html('');
		}
		if(TMP_LDATE.length==12){
			if($('#lDate').val() != null && $('#lDate').val() != '') $('#e_date_end').html($('#lDate').val() +" "+$('#lHour').val()+"시 "+$('#lMinute').val()+"분 ");
		}else{
			$('#l_date_end').html('');
		}
		
		selMinFlag = false;
		
		getCar();
	});
	
	// ---click-car
	//차량 선택 시 css 적용, carTypeName에 값 세팅하는 스크립트[S]
	$(".carList li a").on('click', function(){//제일 처음
		console.log("차량의 class11="+$(this).attr("class"));
		
		// 차량손해면책제도 초기화
		$("#ldwList li").removeClass('selected');
		$("#benz_ldw li").removeClass('selected');
		$("#ldwId").val("");
		$("#ldwId2").val("");
		
		_last_event_obj = 'car'; // 차량을 클릭했음
		
		var $this = $(this);
		var classText = $this.attr("class");		
		
		// 이미 선택한 차량이면 해제
		if (classText.indexOf("wg-bol") >= 0)
		{
			$("#orgnCartype").val("");
			$("#carTypeName").val("");
			$("#selCarType").val("");
			$("#selCarCd").val("");
			$("#modelNm").text(""); //티커에서 차량이름 지움
			
			$this.removeClass('cl-point1 wg-bold');
			
			getTime2();
			
			if($("#branchId").val() != '000012'){ //제주지점이 아니면 가능한 지점을 조회
				getBranchList();
			}

			console.log("9-0. 차량 선택 시 가격 계산");
			getPayment();
			checkLicenseInput11();
			
			$(".through_line_span").hide();
			return;
		}
		
		if(classText != "cl-thin"){
			$(".carList li a").removeClass('cl-point1 wg-bold');
			var orgn = $this.attr('data-orgn');
			var type =$this.attr('data-cartype');
			var cd = $this.attr('data-car');
			var carCd = $this.attr("data-carcd");
			
			if( type.substring(0,2) == "BE" && $("#branchId").val() == "000012"){//제주 벤츠의 경우 2017.08.08
				//$("#benz_check").show();
				$("#ldw-all-li").hide();
			}else{
				//$("#benz_check").hide();
				$("#ldw-all-li").show();
			}
			
			$("#orgnCartype").val(orgn);
			$("#carTypeName").val(type);
			$("#selCarType").val(cd);
			$("#selCarCd").val(carCd);
			$(".carList li a[data-orgn="+orgn+"]").addClass('cl-point1 wg-bold');
			
			var carNm = $(this).text();
			$("#modelNm").html(carNm);
			
			//수입차 면허체크
			if( !checkLicenImports(carCd) ){
				hasCheckCar = true;
				checkLicenseInput11();
			}else{
				hasCheckCar = false;
				checkLicenseInput11();
			}
			
			//console.log($("#carTypeName").val()+"!!!!!");
			/*
			 * 	12인승 차량 선택 시 alert
			 * */
			$.ajax({
				url : '/rent/rentcar/getCDVal.json',
				type : 'POST',
				dataType : 'json',
				data : {"carTypeName":$("#carTypeName").val()},
				success : function(data) {
					//26세 이상 체크
					var cdcheck = true;
					if(data.cdCnt > 0){
						alert("해당 차량은 26세 이상, 면허 취득 3년 이상,\n면허 종별로 1종 보통 이상이 아니면 대여 거부 될 수 있습니다.");
						hasCheckCar = true;
						hasCDVal = data.cdCnt; 
						checkLicenseInput11();
					}else{
						hasCheckCar = false;
						hasCDVal = 0;
						checkLicenseInput11();
					}
					
					if($("#userClass").val() != "1"){
						checkingLicenseIssued();	
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
					console.log(arguments);
				}
			});
			
			getTime2();
			
			console.log("branchId="+$("#branchId").val());
			if($("#branchId").val() != '000012'){ //제주지점이 아니면 가능한 지점을 조회
				getBranchList();
			}

			console.log("9-0. 차량 선택 시 가격 계산");
			getPayment();
			checkLicenseInput11();
			
			$("#alert-cartype").removeClass("msg-alert");
			$("#span-cartype").html("");
			
			if($("#branchId").val() != '000012'){ //200811 제주지점이 아닐경우, 날짜/시간/지점 선택전에 차량을 선택한 경우
				if($("#sDate").val() == "" || $("#branchId").val() == "") {
					alert("기간/지점 선택을 설정 해주세요. 선택된 차량에 따라 예약 가능한 지점만 노출됩니다.");	
				}
			}
		}else{
			alert('선택하신 차량은 예약이 완료되어 예약이 불가능 합니다.');
		}
		ldwAbleCheck();
	});
	//차량 선택 시 css 적용, carTypeName에 값 세팅하는 스크립트[E]
	
	// 지역 변경시 지점 검색 대여지점 반납지점 변경 및 편도 서비스 확인 
	$('#cdId').change(function(){
		ldwAbleCheck();
		// 선택한 지역에 따라 지점 가져오기
		console.log("4. 대여 지역이 변할 때 그 지역의 지점을 가져온다.");
		getBranchList();
	});
	
	$('#branchId').change(function(){
		ldwAbleCheck();
		//지점 선택에 따라 편도여부 판단 후 반납지점 선택 셋팅
		console.log("5. 대여 지점 선택을 했을 때 편도 가능 여부를 판단한다.");
		getOneway();
		getCar();
		getTime2();
		
		$("#alert-branch").removeClass("msg-alert");
		$("#span-branch").html("");
		if($("#branchId2").val() != ""){
			$("#alert-branch2").removeClass("msg-alert");
			$("#span-branch2").html("");
		}
	});
	
	$("#branchId2").change(function(){
		ldwAbleCheck();
		console.log("8. 반납지점이 대여지점과 다르면 시간을 다시 가져온다.");
		console.log("8-1. branchId="+$("#branchId").val());
		console.log("8-2. branchId2="+$(this).val());
		
		$("#alert-branch2").removeClass("msg-alert");
		$("#span-branch2").html("");
	})
	
	$(".branch_id").change(function(){
		ldwAbleCheck();
		if($("#branchId").val() != ""){
			$('#sel2_che').html($('#branchId option:selected').text());
		}else{
			$('#sel2_che').html("");
		}
//		if($("#branchId2").val() != ""){
//			$('#sel2_che2').html($('#branchId2 option:selected').text());
//		}else{
//			$('#sel2_che2').html("");
//		}
	});
	
	
	//---click- 면책선택
	$("#ldwList li a").on('click', function(){
		console.log("--- 차량면책 선택 $('#ldwList li a').on('click' ...");
		if(($("[name=sDate]").val() != "" && $("[name=sDate]").val() != null) 
				&&($("[name=lDate]").val() != "" && $("[name=lDate]").val() != null)
				&&($("[name=cdId]").val() != "" && $("[name=cdId]").val() != null)
				&&($("[name=cdId2]").val() != "" && $("[name=cdId2]").val() != null)
				&&($("[name=branchId]").val() != "" && $("[name=branchId]").val() != null)
				&&($("[name=branchId2]").val() != "" && $("[name=branchId2]").val() != null)
				&&($("[name=carTypeName]").val() != "" && $("[name=carTypeName]").val() != null)){
			$("#ldwList li").removeClass('selected');
			$(this).parent().addClass("selected");
			
			$("#content-div").find(".msg-alert").removeClass("msg-alert");
			$("#content-div").find(".msg-txt").text("");
			
			var cd = $(this).attr("data-cd");
			$("#ldwId").val(cd);
			$("#ldwId2").val(cd);
			
			/*20180222 면허번호 검증 process 추가*/
			$(".ldw-all").addClass("essential");
			$(".ldw-all").append("<strong class=\"check\">필수</strong>");

			getPayment();
		}else{
			$("#ldwList").hide();
			$("#noLdwList").hide();
			$("#noLdwList li").on('click', function(e){
				e.preventDefault();
			});
		}
	});
	
	$("#vipLdwList li a").on('click', function(){
		console.log("--- 차량면책 선택 $('#vipLdwList li a').on('click' ...");
		if(($("[name=sDate]").val() != "" && $("[name=sDate]").val() != null) 
				&&($("[name=lDate]").val() != "" && $("[name=lDate]").val() != null)
				&&($("[name=cdId]").val() != "" && $("[name=cdId]").val() != null)
				&&($("[name=cdId2]").val() != "" && $("[name=cdId2]").val() != null)
				&&($("[name=branchId]").val() != "" && $("[name=branchId]").val() != null)
				&&($("[name=branchId2]").val() != "" && $("[name=branchId2]").val() != null)
				&&($("[name=carTypeName]").val() != "" && $("[name=carTypeName]").val() != null)){
			$("#vipLdwList li").removeClass('selected');
			$(this).parent().addClass("selected");
			
			$("#content-div").find(".msg-alert").removeClass("msg-alert");
			$("#content-div").find(".msg-txt").text("");
			
			var cd = $(this).attr("data-cd");
			$("#ldwId").val(cd);
			$("#ldwId2").val(cd);
			
			/*20180222 면허번호 검증 process 추가*/
			$(".ldw-all").addClass("essential");
			$(".ldw-all").append("<strong class=\"check\">필수</strong>");

			getPayment();
		}else{
			$("#ldwList").hide();
			$("#vipLdwList").hide();
			$("#noLdwList").hide();
			$("#noLdwList li").on('click', function(e){
				e.preventDefault();
			});
		}
	});
	
	//--- click-benz-event
	$("#benz_ldw li a").on('click', function(){//벤츠이벤트
		console.log("--- click-benz-event");
		if(($("[name=sDate]").val() != "" && $("[name=sDate]").val() != null) 
				&&($("[name=lDate]").val() != "" && $("[name=lDate]").val() != null)
				&&($("[name=cdId]").val() != "" && $("[name=cdId]").val() != null)
				&&($("[name=cdId2]").val() != "" && $("[name=cdId2]").val() != null)
				&&($("[name=branchId]").val() != "" && $("[name=branchId]").val() != null)
				&&($("[name=branchId2]").val() != "" && $("[name=branchId2]").val() != null)
				&&($("[name=carTypeName]").val() != "" && $("[name=carTypeName]").val() != null)){
			$("#benz_ldw li").removeClass('selected');
			$(this).parent().addClass("selected");
			var cd = $(this).attr("data-cd");
			$("#ldwId").val(cd);
			$("#ldwId2").val(cd);
			getPayment();
		}else{
			$("#benz_ldw").hide();
			$("#benz_ldw_no").show();
			
			$("#benz_ldw_no li").on('click', function(e){
				e.preventDefault();
			});
		}
	});
	
	$("[name=mobile]").focusout(function(){
		$("#reservHp").html($("[name=mobile]").val());
	});	
	
	$("[name=userNm]").on('change', function(){
		$("#reservNm").html($(this).val());
	});
	
	$("[name=birthday]").on('change', function(){
		$("#reservBirth").html($(this).val());
	});
	
	$("[name=mobile]").on('change', function(){
		$("#reservHp").html($(this).val());
	});
	
	$("[name=emailId]").on('change', function(){
		var email="";
		if($(this).val() != "" && $(this).val() != null
				&& $("[name=domain]").val() != "" && $("[name=domain").val() != null){
			email = $(this).val() + "@" + $("[name=domain]").val();
		}
		$("#email").val(email);
		$("#reservEmail").html(email);
	});
	
	$("[name=domain]").on('change', function(){
		var email="";
		if($(this).val() != "" && $(this).val() != null
				&& $("[name=emailId]").val() != "" && $("[name=emailId").val() != null){
			email = $("[name=emailId]").val() + "@" + $(this).val();
		}
		$("#email").val(email);
		$("#reservEmail").html(email);
	});
	
	$("#selDomain").on('change', function(){
		$("#domain").val($(this).val());
		$("#domain").trigger('change');
		
		if($("#selDomain").val() != "" && $("#selDomain").val() != null){//텍스트 수정 불가, 비활성화
			$("#domain").addClass("readonly");
			$("#domain").prop("readonly", true);
			$("#domain").prop("disabled", true);
			
			$("#alert-email").removeClass("msg-alert");
			$("#span-email").html("");
		}else{//텍스트 수정가능, 활성화
			$("#domain").removeClass("readonly");
			$("#domain").prop("readonly", false);
			$("#domain").prop("disabled", false);
		}
	});
	
	$("[name=licenseType]").on('change', function(){
		var lcnsType = $("[name=licenseType]").val();
		var lcnsNo = $("[name=licenseNo]").val();
		var lcnsAvil = $("[name=licenseAvil]").val();
		
		var userCls = $("#userClass").val();
		var ldwId = $("#ldwId").val();
		
		/*20180222 면허번호 검증 process 적용*/
		if(lcnsType != ""){
			$("#alert-lcnsType").removeClass("msg-alert");
			$("#span-lcnsType").html("");
		}

	});
	
	
	// 꼭 확인해주세요 scroll
	$("#modal-terms-check .modal-scroll").scroll( function() {
		var elem = $("#modal-terms-check .modal-scroll");
		if ( elem.scrollTop() + elem.outerHeight() >= elem[0].scrollHeight / 3 ) { /* 20180402 */
			$("#modal-terms-check .btn-box .btn").removeClass("btn-color4").addClass("btn-color1");
			$(".guidbox").css('display','none');
		}
	});

});



//이놈 어따 쓸까?
//라이센스 유효성 검사에 필요한 데이터가 모두 있다면 라이센스 체크 및 11인승 가능여부 체크
//즉 날짜, 차, 이름, 생년월일, 라이센스타입, 라이센스 no, 적성검사 만료일이 모두 입력되거나 모두 입력 된 후 바뀌면 체크해줘야하는 함수.
function checkLicenseInput11(){
	var userClass = $("#userClass").val();
	if(userClass != 1){
		//우선 데이터들이 모두 들어가 있느지 체크해야함.
		var sDate = $("#sDate").val();
		var carTypeName = $("#carTypeName").val(); 
		var userNm = $("[name=userNm]").val();
		var birthday = $("[name=birthday]").val();
		var licenseType = $("[name=licenseType]").val();
		var licenseNo = $("[name=licenseNo]").val();
		var branchId = $('#branchId').val();
		var branchId2 = $('#branchId2').val();
		
		var lcnLength = licenseNo.length; 
		var hasLcnNo = false;
		var hasLncTypeG  = false;
		
		if(lcnLength == 12)
			hasLcnNo = true;
		
		if(sDate != "" && userNm != "" && birthday != "" && licenseType != "" && licenseNo != "" && hasLcnNo){
			
			//면허 취득 년도
			var licYear = licenseNo.substring(2,4);
			var cDate = dateFormat(sDate, "", 0);
			var sYear2 = cDate.substring(2,4);

			if(licYear - sYear2 == 0){
				alert("면허발급일이 1년미만이라 예약이 불가합니다.");
				$("#span-lcnsNo").html("면허발급일이 1년미만이라 예약이 불가합니다.");
				return false;
			}
			
			//국제면허는 그냥 인정
			if(licenseType == '106009')
				return chkFlag;
			else{
				//라이센스가 유효하면
				var chkFlag = checkLcns(); 
				return chkFlag;
			}
		}else{
			//입력값이 다 없음.입력값 체크
			//만약 대여일, 차가 선택되었으면 제1운전자 라이센스 관련 부분 활성화
			if(sDate != "" && carTypeName != "" && branchId != "" && branchId2 != ""){
				setLcnsInput(false, true);
				return true;
			}
			/*else if(sDate != "" && carTypeName == "" && branchId != "" && branchId2 != "" && hasCheckCar){
				//11인승에서 걸렸을 경우 활성화 시키기 위해서
				return true;
			}
			*/
			/*
			if(sDate == "" || carTypeName == "" || branchId == "" || branchId2 == ""){
				setLcnsInput(true, false);
				return true;
			}
			*/
			else{
				setLcnsInput(false, false);
				return true;
			}
		}
	}
	
}

//수입차 면허체크( 만 26세  면허 3년이상)
function checkLicenImports(carCd, checkType){
	var userCls = $("#userClass").val();
	
	var step1Msg = "해당 차량은 만 26세 이상, 면허 취득 3년 이상이 아니면 대여 거부 될 수 있습니다.";	
	var step2Msg = "해당 차량은  만26세 이상, 면허 취득 3년 이상만 대여 가능합니다.";
	
	if(userCls != "1"){
		var birthDayCheck = ageCheck(26);
		var licYear = $('[name=licenseNo]').val().substring(2,4);
		
		//대여시작일 연도
		var sDate = dateFormat($("#sDate").val(), "", 0);//yyyyMMdd
		var sYear2 = 	sDate.substring(2,4);
		
		var sDate = $("#sDate").val();
		var userNm = $("[name=userNm]").val();
		var birthday = $("[name=birthday]").val();
		var licenseType = $("[name=licenseType]").val();
		var licenseNo = $("[name=licenseNo]").val();								
		var branchId = $('#branchId').val();
		var branchId2 = $('#branchId2').val();
		
		// 중복 alert 및 alert 문구 구분으로 인해 checkType 구분
		if(checkType == "step2"){
			if(carCd == "232009"){
				if(!birthDayCheck){
					alert( step2Msg );	
					return false;
				}
				if(licYear != ""){
					if(licYear - sYear2 > -3 && licYear - sYear2 < 3){
						alert( step2Msg );	
						return false;
					}else{
						return true;
					}
				}else{
					alert( step2Msg );
					return false;
				}
			}else{
				return true;
			}
		}else{
			if(carCd == "232009"){
				if(!birthDayCheck){
					if(sDate == "" || userNm == "" || birthday == "" || licenseType == "" || licenseNo == "" || branchId == "" || branchId2 == ""){
						alert( step1Msg );	
					}
					return false;
				}
				if(licYear != ""){
					if(licYear - sYear2 > -3 && licYear - sYear2 < 3){
						if(sDate == "" || userNm == "" || birthday == "" || licenseType == "" || licenseNo == "" || branchId == "" || branchId2 == ""){
							alert( step1Msg );	
						}
						return false;
					}
				}else{
					if(sDate == "" || userNm == "" || birthday == "" || licenseType == "" || licenseNo == "" || branchId == "" || branchId2 == ""){
						alert( step1Msg );	
					}
					return false;
				}
			}else{
				return true;
			}
		}
	}else{
		if(carCd == "232009"){
			alert( step1Msg );
			return false;
		}else{
			return true;
		}
	}
}

//11인승 만 26세 면허 3년이상
function checkLicenPeriod(){
	
	var licenseType = $("[name=licenseType]").val();
	
	//2종 보통이면 불가
	if(licenseType == "106005"){
		alert("해당 차량은  만26세 이상, 면허 취득 3년이상, 면허 종별로 1종 보통 이상만 대여 가능합니다.");
		return false;
	}else if(licenseType == "106009"){
		//국제면허면 우선 그냥 패스
		return true;
	}
	
	//대여시작일 년월일
	var sDate = dateFormat($("#sDate").val(), "", 0);//yyyyMMdd
	var sYear 	=  	sDate.substring(0,4);
	var sMonth 	= 	sDate.substring(4,6);
	var sDay 	=	sDate.substring(6,8);
	var sMonDay =	sDate.substring(4,8);
	var sYear2 = 	sDate.substring(2,4);
	
	//운전자 생년월일
	var userDate = $('[name=birthday]').val();
	var userYear 	=  	userDate.substring(0,4);
	var userMonth 	= 	userDate.substring(4,6);
	var userDay 	=	userDate.substring(6,8);
	var userMonDay =	userDate.substring(4,8);
	
	//면허 취득 년도
	var licYear = $('[name=licenseNo]').val().substring(2,4);
	
	var age = sMonDay < userMonDay?sYear - userYear - 1:sYear - userYear;
	
	if(age > 25){
		//만 26세 이상
		if(licYear - sYear2 > -3 && licYear - sYear2 < 3){
			//-3보다 크고 3보다 작을경우
			alert("해당 차량은  만26세 이상, 면허 취득 3년이상, 면허 종별로 1종 보통 이상만 대여 가능합니다.");
			return false;
		}else{
			return true;
		}
	}else{
		//만 26세 이하
		alert("해당 차량은  만26세 이상, 면허 취득 3년이상, 면허 종별로 1종 보통 이상만 대여 가능합니다.");
		return false;
	}
}

//getCDVal.json 11인승 여부 체크 url

//라이센스 체크
function checkLcns(){
	var licenseType = $("[name=licenseType]").val();
	var licenseAvil = $("[name=licenseAvil]").val();
	var licenseNo = $("[name=licenseNo]").val();
	var userNm = $("[name=userNm]").val();
	var birthday = $("[name=birthday]").val();
	var sDate = $("[name=sDate]").val();
	var lDate = $("[name=lDate]").val();
	var carCd = $("#selCarCd").val();
	
	if($("[name=licenseType]").val()!="106009"){
		//수입차 면허체크
		if( !checkLicenImports( carCd, "step2" ) ){
			setLcnsInput(false, false);
			//조건이 안맞으면 차량선택 해제하고 노란 테두리에 위치로 이동처리
			$("#alert-cartype").addClass("msg-alert");
			$("#span-cartype").html("해당 차량은  만26세 이상, 면허 취득 3년  이상만 대여 가능합니다.");
			var offset = $('#alert-cartype').offset();
			$("html, body").animate({scrollTop: offset.top-150}, 10);
			
			$(".carList li a").removeClass('cl-point1 wg-bold');
			$("#carTypeName").val('');
			$("#orgnCartype").val('');
			$("#selCarType").val('');
			$("#selCarCd").val('');
				
			getTime2();
			ldwAbleCheck();
			if($("#branchId").val() != '000012'){ //제주지점이 아니면 실행가능한 지점 불러온다
				getBranchList();
			}
			getPayment();
			$("#modelNm").text("");
		}else{
			setLcnsInput(true, true);
		}
		
		if(carCd != "232009"  && carCd != ""){
			$.ajax({
				url : '/rent/rentcar/lcnsCheck.json',
				type : 'POST',
				dataType : 'json',
				data : {
						"channel":"DCOM",
						"licenseType" : licenseType,
						"licenseNo" : licenseNo,
						"userNm" : userNm,
						"birthday" : birthday
				},
				success : function(data) {
					var toDay = new Date();
					var year = toDay.getFullYear();
					var month = (toDay.getMonth()+1)<10?("0"+(toDay.getMonth()+1)):(toDay.getMonth()+1);
					var date = (toDay.getDate())<10?("0"+(toDay.getDate())):(toDay.getDate());
					var chk_dt = year+""+month+""+date;       
					
					$("input[name=pDrvingLcnsChkDt]").val(chk_dt);
					$("input[name=pDrvingLcnsChkCd]").val(data.LCNS_RTN_CD);
					$("input[name=pDrvingLcnsChkMsg]").val(data.LCNS_RTN_NM);
					
					if(data.LCNS_RTN_CD=="00"||data.LCNS_RTN_CD=="02"){
						if(hasCheckCar){
						//11인승인지와 11인승이면 조건에 맞는지 체크
							if(checkLicenPeriod()){
								//조건에 맞으면 
								//회원, 비회원 별로도 활성화 시켜줘야함. userClass  -1 이면 비회원
								setLcnsInput(true, true);
								return true;
							}else{
								//안맞으면
								setLcnsInput(false, false);
								//조건이 안맞으면 차량선택 해제하고 노란 테두리에 위치로 이동처리
								$("#alert-cartype").addClass("msg-alert");
								$("#span-cartype").html("해당 차량은  만26세 이상, 면허 취득 3년이상, 면허 종별로 1종 보통 이상만 대여 가능합니다.");
								var offset = $('#alert-cartype').offset();
								$("html, body").animate({scrollTop: offset.top-150}, 10);
								
								$(".carList li a").removeClass('cl-point1 wg-bold');
								$("#carTypeName").val('');
								$("#orgnCartype").val('');
								$("#selCarType").val('');
								$("#selCarCd").val('');
									
								getTime2();
								ldwAbleCheck();
								if($("#branchId").val() != '000012'){ //제주지점이 아니면 실행가능한 지점 불러온다
									getBranchList();
								}
								getPayment();
								$("#modelNm").text("");
								return false;
							}
						}else{
							// 면허번호 수정 유무 체크
							if( licenseType == "" || licenseAvil == "" || licenseNo == "" || userNm == "" || birthday == "" || sDate == "" ||  lDate == "" ){
								setLcnsInput(false, false);
							}else{
								setLcnsInput(true, true);
							}
							return true;
						}
					}else{
						lcnResultMsg(data);
						setLcnsInput(false, false);
						return false;
					}
				}
			});
		}
		
	}else{
		return true;
	}
}

function setLcnsInput(flag, nextFlag){
	console.log( flag, nextFlag );
	var userClass = $("#userClass").val();
	hasNext = nextFlag 
	if(userClass == "-1"){
		//비회원 비활성
		//class="readonly" readonly="readonly" disabled="disabled"
		if(flag){
			$("[name=userNm]").removeClass("readonly");
			$("[name=userNm]").addClass("readonly");
			$("[name=userNm]").prop("disabled", true);
			$("[name=userNm]").prop("readonly", true);
			
			$("[name=birthday]").removeClass("readonly");
			$("[name=birthday]").addClass("readonly");
			$("[name=birthday]").prop("disabled", true);
			$("[name=birthday]").prop("readonly", true);
			
			$("[name=licenseType]").removeClass("readonly");
			$("[name=licenseType]").addClass("readonly");
			$("[name=licenseType]").prop("disabled", true);
			$("[name=licenseType]").prop("readonly", true);
			
			$("[name=licenseNo]").removeClass("readonly");
			$("[name=licenseNo]").addClass("readonly");
			$("[name=licenseNo]").prop("disabled", true);
			$("[name=licenseNo]").prop("readonly", true);
			
			$("#span-name").html("");
			$("#span-birth").html("");
			$("#span-lcnsType").html("");
			$("#span-lcnsNo").html("");
		}else{
		//비회원 활성화			
			$("[name=userNm]").removeClass("readonly");
			$("[name=userNm]").prop("disabled", false);
			$("[name=userNm]").prop("readonly", false);
			
			$("[name=birthday]").removeClass("readonly");			
			$("[name=birthday]").prop("disabled", false);
			$("[name=birthday]").prop("readonly", false);
			
			$("[name=licenseType]").removeClass("readonly");
			$("[name=licenseType]").prop("disabled", false);
			$("[name=licenseType]").prop("readonly", false);
			
			$("[name=licenseNo]").removeClass("readonly");
			$("[name=licenseNo]").prop("disabled", false);
			$("[name=licenseNo]").prop("readonly", false);
		}
	}else{
		//회원
		if(flag){
			$("[name=licenseType]").removeClass("readonly");
			$("[name=licenseType]").addClass("readonly");
			$("[name=licenseType]").prop("disabled", true);
			$("[name=licenseType]").prop("readonly", true);
			
			$("[name=licenseNo]").removeClass("readonly");
			$("[name=licenseNo]").addClass("readonly");
			$("[name=licenseNo]").prop("disabled", true);
			$("[name=licenseNo]").prop("readonly", true);
			
			$("#span-name").html("");
			$("#span-birth").html("");
			$("#span-lcnsType").html("");
			$("#span-lcnsNo").html("");
		}else{
		//회원 활성화
			setLcnInputDisableClear();
		}
		
	}
	
	checkingLicenseIssued();
}

function setLcnInputDisableClear(){
	
	$("[name=licenseType]").removeClass("readonly");
	$("[name=licenseType]").prop("disabled", false);
	$("[name=licenseType]").prop("readonly", false);
	
	$("[name=licenseNo]").removeClass("readonly");
	$("[name=licenseNo]").prop("disabled", false);
	$("[name=licenseNo]").prop("readonly", false);
}

var selHourFlag = false;	//제주 20시 이후 알러트창 1개만 뜨도록 제한하는 플래그
var selMinFlag = false;	//제주 20시 이후 알러트창 1개만 뜨도록 제한하는 플래그
function fn_changeDate(){
	console.log("fn_changeDate 접근");
	selHourFlag = true;
	selMinFlag = true;

	calcTotalTime();
	chkRentTerm();//24시간 이상 이하 확인
	
	var sDate = calendar._selectFromDate;
	var lDate = calendar._selectToDate;
	
	if (!sDate)
	{
		return; 
	}

	ldwAbleCheck();
	
	var tomorrow = dateFormat('','',1); //내일 날짜 
	var today = new Date();
	var s_hour = today.getHours();//현재 시간
	s_hour += 1;
	
	sDate = "";
	if($("#sDate").val() != null && $("#sDate").val() != ""){
		sDate = dateFormat($('#sDate').val(),'',0);	
	}
	
	lDate = ""; 
	if($("#lDate").val() != null && $("#lDate").val() != ""){
		lDate = dateFormat($('#lDate').val(),'',0);	
	}
	
	if(sDate!='' && sDate!=null && lDate!='' && lDate!=null){
		$("#div-sDate").removeClass("msg-alert");
		$("#span-sDate").html("");
		
		$("#div-lDate").removeClass("msg-alert");
		$("#span-lDate").html("");
		if(lDate != '' && sDate >= lDate){
			alert('반납 일시는 대여 일시보다 커야 합니다.');
			
			$("#sDate").val('');
			$("#lDate").val('');
			return false;
		}
		
		getPossTime();
		//getPossLtime($('#lDate'));	
	}
	
	if($("#reservMenu .selected").text().trim() == "내륙예약"){
		$("div.store-area:eq(0)").find('span.fl').removeClass('is-disabled'); //대여지점 disable 해제
	}
}

function lcnResultMsg(obj){
	/*
	 00 : 정상
	 01 : 면허번호 없음
	 02 : 재발급된 면허
	 03 : 분실된 면허
	 04 : 사망 취소된 면허
	 11 : 취소 된 면허
	 12 : 정지 된 면허
	 13 : 기간 중 취소 면허
	 14 : 기간 중 정지 면허
	 21 : 정보불일치(이름)
	 22 : 정보불일치(생년월일)
	 23 : 정보불일치(암호일련번호)
	 24 : 정보불일치(종별)
	 31 : 암호화 안 된 면허 
	 */
	switch(obj.LCNS_RTN_CD){
	case "01" :
		$("#alert-lcnsNo").addClass("alert-msg");
		$("#span-lcnsNo").html(obj.RTN_ALERT_MSG);
		var offset = $("[name=licenseNo]").offset();
		$("html, body").animate({scrollTop: offset.top-150}, 10);
		alert(obj.RTN_ALERT_MSG);
		break;
	case "21" :
		$("#alert-name").addClass("alert-msg");
		$("#span-name").html(obj.RTN_ALERT_MSG);
		var offset = $("[name=userNm]").offset();
		$("html, body").animate({scrollTop: offset.top-150}, 10);
		alert(obj.RTN_ALERT_MSG);
		break;
	case "22" :
		$("#alert-birth").addClass("alert-msg");
		$("#span-birth").html(obj.RTN_ALERT_MSG);
		var offset = $("[name=birthday]").offset();
		$("html, body").animate({scrollTop: offset.top-150}, 10);
		alert(obj.RTN_ALERT_MSG);
		break;
	case "24" :
		$("#alert-lcnsType").addClass("alert-msg");
		$("#span-lcnsType").html(obj.RTN_ALERT_MSG);
		var offset = $("[name=licenseType]").offset();
		$("html, body").animate({scrollTop: offset.top-150}, 10);
		alert(obj.RTN_ALERT_MSG);
		break;
	default :
		alert(obj.RTN_ALERT_MSG);
		$('[name=licenseNo]').focus();
		break;
	}
}

function changeHourDisabled(){
	var menu = $("#reservMenu .selected").text();
	
	if($('#sDate').val() == "2020-07-31" &&  $.trim(menu) == "제주예약" && $('#sHour').val() == "21"){
		$("#sMinute").val("00");
		$("#sMinute").prop("disabled", true);
	}
//	else{
//		$("#sMinute").prop("disabled", false);
//	}
	
	if($('#lDate').val() == "2020-07-31" &&  $.trim(menu) == "제주예약" && $('#lHour').val() == "21"){
		$("#lMinute").val("00");
		$("#lMinute").prop("disabled", true);
	}
//	else{
//		$("#lMinute").prop("disabled", false);
//	}
}