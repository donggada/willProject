/**
 * 달력 이벤트
 * 2019-02-05 09:00 ~ 12:00시간대 선택방지
 */

var holiydayCnt = 0;
var closedStartDate = new Array;		//"20190406";
var closedEndDate = new Array;		//"20190408";
var closedStartTime = new Array;		//"1000";
var closedEndTime = new Array;		//"1200";

var openHour = "14";
var openMinute = "30";

var openStartHour = "";
var openStartMinute = "";
var openEndHour = "";
var openEndMinute = "";

$(document).ready(function() {
	//branchHoliyday();
	
	// 예약 및 반납 시간 분 체인지시
	$('#sHour, #sMinute, #lHour, #lMinute').change(function(){
		checkClosedBranch();
	});

	// 예약 지점 클릭시
	/*
	$("#div_store_area1").on('click', 'dd a', function(e) {
		if($(this).hasClass('cl-thin is-disabled') == true){
			return false;
		}
		
		setTimeout(function(){
			checkClosedBranch();
		});
	});
	 */
	
	// 반납 지점 클릭시
	/*
	$("#div_store_area2").on('click', 'dd a', function(e) {
		setTimeout(function(){
			checkClosedBranch();
		});
	});
	 */
	$(".fast-reserve-tab .item").click(function(){
		checkClosedBranch();
	});
	
});


//지점별 휴무일 체크
function checkClosedBranch(){
	var revType = $("input[type=radio][name=quickReserveType]:checked").val();		// 제주, 내륙 구분
	var branchId =  $('#branchId').val();		// 대여 지점
	var branchId2 =  $('#branchId2').val();	// 반납 지점
	var checkYn = "";
	
	if(revType == "jeju"){
		branchId = "000012";
		branchId2 = "000012";
	}
	
	if(branchId == "" || branchId == null){
		return;
	}
	//console.log("branchId ------------ : ", revType, branchId, branchId2);
	$.ajax({
		type : "post",
		url : "/rent/rentcar/getBranchHolidays.json",
		data : {
		   'branchId' : branchId,
		   'branchId2' : branchId2
		},
		dataType : "json",
		success : function(data) {
			var str = "";
			var str2 = "";
			var str3 = "";			var selectStartDate = $("#sDate").val().replace(/-/g,"");
			var selectEndDate = $("#lDate").val().replace(/-/g,"");
			var selectStartTime = $("#sHour").val() + "" + $("#sMinute").val();
			var selectEndTime = $("#lHour").val() + "" + $("#lMinute").val();
			
			var list = data.BranchHolidays;
			
			holiydayCnt = list.length
			closedStartDate = [];
			closedEndDate = [];
			closedStartTime = [];
			closedEndTime = [];
			
			for(var i=0; i<list.length; i++){
				closedStartDate.push( list[i].apyStDt );
				closedEndDate.push( list[i].apyEndDt );
				closedStartTime.push( list[i].slsStHh );
				closedEndTime.push( list[i].slsEndHh );
				
				if( selectStartDate + selectStartTime >= list[i].apyStDt + list[i].slsStHh && selectStartDate + selectStartTime <= list[i].apyEndDt + list[i].slsEndHh
						|| 
					selectEndDate + selectEndTime <= list[i].apyEndDt + list[i].slsEndHh && selectEndDate + selectEndTime >= list[i].apyStDt + list[i].slsStHh
				){
					var msg = list[i].branchNm + " 의 휴무일은  <br/>" 
				        + "<strong>" +list[i].apyStDt.substr(0,4) + "년 " 
				        + list[i].apyStDt.substr(4,2) + "월 "
				        + list[i].apyStDt.substr(6,8) + "일 "
				        + list[i].slsStHh.substr(0,2) + ":" +  list[i].slsStHh.substr(2,4) + "시 </strong> 부터  <br/>"
				        + "<strong>" + list[i].apyEndDt.substr(0,4) + "년 " 
				        + list[i].apyEndDt.substr(4,2) + "월 "
				        + list[i].apyEndDt.substr(6,8) + "일 "
						+ list[i].slsEndHh.substr(0,2) + ":" + list[i].slsEndHh.substr(2,4) + "시 </strong> 까지 입니다.";
					
					openHour = list[i].slsEndHh.substr(0,2);
					openMinute = list[i].slsEndHh.substr(2,4);
					
					openStartHour = list[i].apyStDt.substr(0,2);
					openStartMinute = list[i].apyStDt.substr(2,4);
					openEndHour = list[i].slsEndHh.substr(0,2);
					openEndMinute = list[i].slsEndHh.substr(2,4);
					
					// 서브 페이지 문구 보여줌
					$("#txtClosedBranch").html(msg);
					$("#txtClosedBranch").show();
		
					// 메인 페이지 문구 보여주고 예약버튼 클릭 방지
					$(".time-area > .title").html(msg);
					$("#btn_quick").addClass("disable");
					$(".time-area > .time").hide();
					
					setTimeout(function(){
						$("#btn_quick").addClass("disable");
					});
					/*
					for(var j=9; j<20; j++){
						if( j <  closedStartTime[i].substr(0,2) ){
							console.log("close Time1", j);
							str += "<option value='"+addZero(j)+"'>"+addZero(j)+"시</option>";
						}
					}
					for(var j=9; j<20; j++){
						if( j >  closedEndTime[i].substr(0,2) ){
							str2 += "<option value='"+addZero(j)+"'>"+addZero(j)+"시</option>";
						}
					}
					$("#sHour").html(str);
					$("#lHour").html(str2);
					$("#sMinute").html(str);
					$("#lMinute").html(str2);
					 */
						
					return;
				}else{
					// 서브 페이지 문구 숨김				
					$("#txtClosedBranch").hide();
					
					// 메인 페이지 예약시간 보여줌		
					$(".time-area > .title").html("총 대여시간");
					$(".time-area > .time").show();
					checkYN = "N";
				}
			}
			/*
			if(checkYN == "N"){
				console.log("GGGGGGGGGGGGGGGGGGGG");
				str3 = "<option value='00'>00분</option><option value='30'>30분</option>";
				for(var j=9; j<20; j++){
					console.log("close Time1", j);
					str += "<option value='"+addZero(j)+"'>"+addZero(j)+"시</option>";
					str2 += "<option value='"+addZero(j)+"'>"+addZero(j)+"시</option>";
				}
				$("#sHour").html(str);
				$("#lHour").html(str2);
				
				$("#sMinute").html(str3);
				$("#lMinute").html(str3);
			}
			*/
			
			calcTotalTime(); //전체 대여 기간 선택;
		},
		error : function(){
			alert('데이터 통신이 실패했습니다.\n잠시 후 다시 시도하세요.');
		} 
	});
}
