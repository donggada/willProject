function initEventHandler()
{
	/* 운전면허증 팝업*/		
	$('.license_bt').click(function(){
		$('.dimd').css('display', 'block');
		$('.modal-pop.license').css('display', 'block');
	});
	
	/* 달력 활성화 */
	$('#sDateSpan,#lDateSpan').click(function(e){
		
		//반납일 필드를 클릭했고 반납일 필드가 readonly 클래스를 갖고 있으면 달력을 열지 않음
		if((e.target.id == 'lDate' || e.target.id == 'lDateSpan') && $("#lDate").hasClass("readonly"))
		{
			return;
		}
		calendar.init("type2"); // 이 페이지는 type2로 해야 제대로 나옵니다.
	})
	
	/* 이용약관 체크 */	
	$("div.terms-listbox input").change(function(){			
		if (this.id == "term-check-all") //전체 동의일 경우
		{
			$("div.terms-listbox input:gt(0)").prop('checked', $(this).is(":checked"));
		}
		else //개별 동의일 경우 (동의갯수 확인) 5개 체크되어 있으면 전체동의 체크. 아니면 해제.
		{
			var checks = $('div.terms-listbox input:gt(0):checked').length;
			$("#term-check-all").prop('checked', checks == 5); 
		}
	})

	$('#driver_tab1,#driver_tab2').click(function()
			{
				$('#attachRow').toggle(this.id == 'driver_tab2');
			});
	
	$('select.hour,select.timeChange').change(function()
		{
			//달력이 보이고 있으면 달력을 감춤
			if ($('#divOutside').is(':visible'))
			{
		 		$('#ui-datepicker-div').hide();
		 		$('#divOutside').hide();
			}
			
			calcTotalTime(); //전체 대여 기간 선택
		});
	
	//운전면허 check start
	/*
	$("div.input-field [name=userNm],[name=birthday],[name=licenseType],[name=licenseNo],[name=licenseAvil").change(function(e)
			{
				if(corpID == ''){
					//운전면허 필수필드 5개가 값이 다 ''가 아니면 운전먼허 자동체크				
					var userNm = $("div.input-field [name=userNm]").val();
					var birthday = $("div.input-field [name=birthday]").val();
					var licenseType = $("div.input-field [name=licenseType]").val();
					var licenseNo = $("div.input-field [name=licenseNo]").val();
					var licenseAvil = $("div.input-field [name=licenseAvil]").val();
	
					if (userNm == '' || birthday == '' || licenseType == '' || licenseNo == '' || licenseAvil == '')
					{
						console.log("필수5필드 일부 입력 안됨");
						return false;
					}
					
					console.log("필수5필드 입력완료: 운전면허유효성 체크");
						
					$.ajax({
						url : '/rent/rentcar/lcnsCheck.json',
						type : 'POST',
						dataType : 'json',
						data : {"channel":"DCOM","licenseType":licenseType,"licenseNo":licenseNo,
							"userNm":userNm,"birthday":birthday,"sDate":$("[name=sDate]").val(),"lDate":$("[name=lDate]").val()},
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
								console.log("유효한 운전면허!!!");
							}else{
								alert(data.RTN_ALERT_MSG);
								return false;
							}
						}
					});
				}
			}); //운전면허 체크 end
			*/

} // end of initEventHandler


$(function(){
	
	initEventHandler();
	
	})