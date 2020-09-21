/* PC Double Calendar 1.0 - 2018-2-15
 * Programmed by Lee Sangheon
 */
var calendar = 
	{
		_isInit:false,
		_selectFromDate: null, //yyyy-mm-dd(string)
		_selectToDate: null,	//yyyy-mm-dd(string)
		_pickDate: null, //현재 캘린더에 표시된 날짜(DateType)
		_selectableDate: null, // 선택가능한 날짜
		_maxRentDate: null, // 대여가능일 최대값 (오늘로부터 60일)
		_maxMonth: null, // 달력으로 표시할 최대월		
		_disabledDateArr: null, //선택금지 날짜 배열
		$tbody: null,		
		$year: null,
		$month: null,
		_clickCount: 0,
		_prevFromDate: null,
		_prevToDate:null,
		_prevClickCount:0,
		
		/**
		 * 달력 만들기(private function)
		 */
		make:function (idx) {
			
			var _self = this;
			var currentDate = new Date();
			var cDate = currentDate.getDate();
			var cDateStr = _self.toYmd(currentDate);			
			var makeDate = _self._pickDate;				
		    var year = makeDate.getFullYear();
		    var month = makeDate.getMonth();		    
		    var $tbody = _self.$tbody.eq(idx);
		    var $year= _self.$year.eq(idx);
		    var $month = _self.$month.eq(idx);
		    
			var menu = $("#reservMenu .selected").text();
			var s_hour = currentDate.getHours();//현재 시간
			var s_min = currentDate.getMinutes();//현재 분
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

			var cHour = currentDate.getHours();	  
			var cMin = currentDate.getMinutes();
			var cHHMM = _self.getDigitNum(cHour) + _self.getDigitNum(cMin); 			
			$optes = $("#sHour option");
			
			var nextDate = _self.addDates(cDateStr,1) //내일 
			var todayDate = _self.addDates(cDateStr,0) //오늘 
			var nextDateDisable = false;
			
			var branchId = $("#branchId").val();
			var requestDay = 91;
			var inlandRequestDayCheck = true; 
			
			// 제주지점은 최초 90일, 내륙은 최초 60일 예약 가능(20190403)
			// 내륙지점은 최초 30일 예약 가능(20200610)
			if(branchId != "000012")
			{
				if( cHour >= 9 && cHour < 19){
					inlandRequestDayCheck = true;
					
					if(cHour == 18 && cMin >= 30) {
						inlandRequestDayCheck = false;	
					}
				} else {
					inlandRequestDayCheck = false;
				}
				
				var requestSdate = new Date(_self.addDates(cDateStr,1));
				var requestEdate = new Date(_self.addDates(_self.addMonth(_self.addDates(cDateStr,1), 1), -1));
				var oneDaytime = 86400000;
			    var diffTime = requestEdate.getTime() - requestSdate.getTime();
			    var diffDate = Math.floor(diffTime / oneDaytime);

			    requestDay = diffDate + 1;
			}
			
			if ($optes.last().val() < cHHMM)
			{
				nextDateDisable = true; //내일 선택 불가
			}
		    
		    if (_self._maxRentDate == null) //선택가능한 대여일이 없으면
		    {
		    	_self._maxRentDate = _self.addDates(cDateStr, requestDay); //대여가능일: 내일부터 90일까지 (오늘은 예약불가.내일부터 90일. 그래서 91일)
		    
		    	// 내륙은 2019-05-31 까지 가능(20190403)
		    	/*
		    	if(branchId != "000012" && _self._maxRentDate >= "2019-05-31")
		    	{
		    		_self._maxRentDate = "2019-05-31"
		    	}else{
		    		_self._maxRentDate = _self.addDates(cDateStr, requestDay); //대여가능일: 내일부터 90일까지 (오늘은 예약불가.내일부터 90일. 그래서 91일)
		    	}
		    	*/
		    	
		    	_self._maxMonth = _self.addDates(cDateStr,151).substr(0,7); // 달력으로 표시할 최대월(오늘날짜 + 151일인 날짜의 달)
		    	_self._selectableDate = _self._maxRentDate; // 선택가능한 날짜
		    }
		    
		    if (idx == 0)
		    {
		    	if (year + "-" + month == currentDate.getFullYear() + "-" + currentDate.getMonth())
		    	{
		    		$('a.ui-datepicker-prev').hide(); //이번달 달력일때는 prev 버튼 hide
		    	}
		    	else
		    	{
		    		$('a.ui-datepicker-prev').show(); //이번달 달력아닐때는 prev 버튼 show
		    	}
		    }
		    else //2번째캘린더는 한달+1
		    {
		    	makeDate = new Date(year, ++month, 1);		    	
		    	if (month == 12)
		    	{
		    		year ++;
		    		month = 0;
		    	}
		    	
		    	if (_self.toYmd(makeDate).substr(0,7) == _self._maxMonth)
		    	{
		    		$('a.ui-datepicker-next').hide(); //최대월 달력일때는 next 버튼 hide
		    	}
		    	else
		    	{
		    		$('a.ui-datepicker-next').show(); //최대월 달력아닐때는 next 버튼 show
		    	}		    	
		    }
		    
		    var lastDate = this.getLastDate(month, year);		    
		    $year.text(year);
		    $month.text((month +1) + "월");		    
		    $tbody.empty();

		    var firstTdIndex = makeDate.getDay();		    
		    var lastTdIndex = firstTdIndex + lastDate - 1;
		    
		    var strd = "";
		    var date = 1;
		    var strYM = year + "-" + this.getDigitNum(month + 1);
		    
		    var wkday;
		    var tdClass;
		    var tdTitle;
		    /*
			var holiyDay = [
				{"holiyDay" : "2019-06-06", "holiyDayName" : "현충일"}
				, {"holiyDay" : "2019-08-15", "holiyDayName" : "광복절"}
				, {"holiyDay" : "2019-09-12", "holiyDayName" : "추석연휴"}
				, {"holiyDay" : "2019-09-13", "holiyDayName" : "추석"}
				, {"holiyDay" : "2019-09-14", "holiyDayName" : "추석연휴"}
				, {"holiyDay" : "2019-10-03", "holiyDayName" : "개천절"}
				, {"holiyDay" : "2019-10-09", "holiyDayName" : "한글날"}
				, {"holiyDay" : "2019-12-25", "holiyDayName" : "크리스마스"}
				, {"holiyDay" : "2020-01-01", "holiyDayName" : "신정"}
				, {"holiyDay" : "2020-01-24", "holiyDayName" : "설날연휴"}
				, {"holiyDay" : "2020-01-25", "holiyDayName" : "설날"}
				, {"holiyDay" : "2020-01-26", "holiyDayName" : "설날연휴"}
				, {"holiyDay" : "2020-01-27", "holiyDayName" : "대체공휴일"}
				, {"holiyDay" : "2020-03-01", "holiyDayName" : "삼일절"}
				, {"holiyDay" : "2020-04-30", "holiyDayName" : "부처님오신날"}
				, {"holiyDay" : "2020-05-05", "holiyDayName" : "어린이날"}
			];
			*/
		
		    for (var i= 0; i <= 41; i++)
		    	{		    	
		    		wkday = i%7;		    	
		    		if (wkday == 0)
		    		{
		    			strd += "<tr>";
		    		}    			
		    	
		    		if (i >= firstTdIndex && i <= lastTdIndex)
					{
		    			var strYMD = strYM + "-" + this.getDigitNum(date);
		    			
		    			if (strYMD < cDateStr || (strYMD == todayDate && nextDateDisable)) // 과거날짜는 선택불가능 (내일도 +24시간이 렌트가능한 시간이 아니면 선택불가)
		    			{
		    				strd += '<td class="ui-datepicker-unselectable ui-state-disabled"><span class="ui-state-default">' + date + '</span></td>';    				
		    			}else if(strYMD == cDateStr && $.trim(menu) == "제주예약" && (s_hour > 22 || s_hour ==22 && s_min > 0 )){
		    				strd += '<td class="ui-datepicker-unselectable ui-state-disabled"><span class="ui-state-default">' + date + '</span></td>';    				
		    			}else if(strYMD == cDateStr && $.trim(menu) == "내륙예약"){ //당일예약불가능
		    				strd += '<td class="ui-datepicker-unselectable ui-state-disabled"><span class="ui-state-default">' + date + '</span></td>';
		    			}else if(strYMD == _self.addDates(cDateStr,1) && $.trim(menu) == "내륙예약" && inlandRequestDayCheck == false){
		    				strd += '<td class="ui-datepicker-unselectable ui-state-disabled"><span class="ui-state-default">' + date + '</span></td>';	
		    			}else{
		    				tdClass = (strYMD == cDateStr ? "ui-datepicker-today" : "") +  (wkday == 0 || wkday == 6 ? " ui-datepicker-week-end": "");
		    				
		    				//공휴일 지정
		    				/*
		    				tdTitle = strYMD;
		    				for(var j=0; j<holiyDay.length; j++){
		    					if(strYMD == holiyDay[j].holiyDay){
		    						tdClass += " ui-datepicker-week-end";
		    						tdTitle = "";
		    						tdTitle += holiyDay[j].holiyDayName;
		    					}
		    				}
		    				*/
			    			if (strYMD > _self._selectableDate) // 선택가능한 날짜보다 크면 (예약일로 선택은 불가능하고 반납일
			    			{
			    				tdClass += " ui-datepicker-unselectable  ui-state-disabled"  ;
			    			}
			    			
			    			if (strYMD > _self._maxRentDate) // 예약가능일보다 크면 선택제한 클래스 추가
			    			{
			    				tdClass += " ui-restrict";
			    			}		    				
		    				if (tdClass != "")
		    					//tdTitle == "" ? tdTitle = strYMD : tdTitle = tdTitle;
		    					tdClass = " class='" + tdClass + "'";
		    					tdTitle = " title='" + tdTitle + "'";
		    					//strd += '<td ymd="' + strYMD +'" ' + tdClass + tdTitle + '><a class="ui-state-default" href="javascript:void(0);">' + date + '</a></td>';
		    					strd += '<td ymd="' + strYMD +'" ' + tdClass + '><a class="ui-state-default" href="javascript:void(0);">' + date + '</a></td>';
		    			}
		    			date ++;
					}
		    		else
		    		{
		    			strd += "<td></td>";
		    		}
		    		
		    		if (i%7 == 6)
		    		{
		    			strd += "</tr>";
		    			if (i >= lastTdIndex)
						{
		    				break;
						}
		    		}     		
		    	}
		
		    $tbody.append(strd);
		    
		    // 달력 휴무일 표시
		    setTimeout(function(){
		    	calendarHoliyDay();
		    });
		},
		
		setCalendar: function(fromDate,toDate) {
			this._selectFromDate = fromDate;
			this._selectToDate = toDate;
			this._prevFromDate = fromDate;			
			this._prevToDate = toDate;
			this._clickCount = 2;
		},
		
		addDates: function( fromYMD, days ) {
			var date = this.toDate(fromYMD);
			date.setDate(date.getDate() + days);
			return this.toYmd(date);
		},
		
		addMonth: function( fromYMD, month ) {
			var date = this.toDate(fromYMD);
			date.setMonth(date.getMonth() + month);
			return this.toYmd(date);
		},
		
		/* private function */
		selectRange: function()
		{
			var _self = this;
			fromDate =_self._selectFromDate;
			toDate = _self._selectToDate;
			
			// 선택영역 초기화
			$("table.ui-datepicker-calendar td.ui-state-highlight").removeClass("ui-state-highlight ui-state-highlight-start ui-state-highlight-end");
			
			//대여일 표시
			if (!fromDate) return;			
			$("td[ymd='"+ fromDate + "']").addClass('ui-state-highlight-start ui-state-highlight');	
			
			//반납일 표시
			if (!toDate) return;			
			$("td[ymd='"+ toDate + "']").addClass('ui-state-highlight-end ui-state-highlight');	
    		
			var $tds = $("table.ui-datepicker-calendar td[ymd]"); 
			
			for (var i=0, len = $tds.length ; i < len; i++ )
			{
				var $td = $($tds[i]);				
				var ymd = $td.attr("ymd");	
				
				if (ymd >= toDate) return;
				
				if (ymd > fromDate)
				{
					// 대여일과 반납일 사이 표시
					$td.addClass('ui-state-highlight');
				}		
			}
		},
		
		addEvent:function () {
			
			var _self = this;
			
		    $('body').prepend('<div id="divOutside" style="width:100%;height:100%;z-index:11;position:fixed"></div>');		//캘린더 외부 클릭시 닫기용  
			
		    $(document).on('click', '#divOutside', function() {	   	
		    	$('#divOutside').hide();
		    	$('#ui-datepicker-div').hide();
		    	
		    	// 대여일 날짜 선택 후 달력을 나갔을시 선택된 날짜 초기화(20190403)
		    	if(_self._clickCount == 1){
		    		resetDate(); //선택된 날짜를 클리어
		    		_self._selectableDate = _self._maxRentDate;
		    	}
	    		_self._selectFromDate = _self._prevFromDate;
	    		_self._selectToDate = _self._prevToDate;
		    	_self._clickCount = _self._prevClickCount;
		    	_self.selectRange();
		    	
			});

			$('#menucontainer').click(function(event){
			    event.stopPropagation();
			});
			
		    $('a.ui-datepicker-prev,a.ui-datepicker-next').on('click', function() {		    	
		    	var value = (this.title == "Prev") ? -1: 1;		    	
		    	_self._pickDate.setMonth(_self._pickDate.getMonth() + value);
		    	_self.make(0);
		    	_self.make(1);	
		    	_self.selectRange();
		    	
		    	//선택불가능한 날짜 처리
				$(this._disabledDateArr).each(function (i, value)
						{
							_self.$tbody.find("[ymd='" + value + "']").addClass('ui-datepicker-unselectable ui-state-disabled');
						});
		    });
   
		    $("table.ui-datepicker-calendar > tbody").on('click', 'a', function(e) {
		    	
		    	var $me = $(e.target);
		    	var $td = $me.parent();
		    	var branchId = $("#branchId").val();
		    	console.log("count : ", _self._clickCount);
		    	if (calendar._selectToDate != null) // 반납일까지 선택되었을때 클릭하면 선택금지이어도 대여일,반납일 초기화
		    	{
		    		_self._clickCount = 0;
		    		calendar._selectFromDate = null;
		    		calendar._selectToDate = null;
		    		calendar.selectRange();
		    		_self.$tbody.find("td.ui-restrict").addClass('ui-datepicker-unselectable ui-state-disabled'); //선택제한 날짜들을 선택금지처리
		    		_self._selectableDate = _self._maxRentDate;
		    		return;
		    	}
		    	
		    	if( $td.hasClass('ui-state-disabled')) return; // disable 선택방지	    	
		    	if ($td.hasClass('ui-datepicker-today')) //오늘날짜는 경고 + 선택방지
		    	{
//		    		alert('예약은 익일(현시간에서 24시간 이후)부터 가능합니다. 자세한 사항은 해당 지점으로 문의 바랍니다.');
//		    		return;
		    	}
		    	
		    	var ymd = $td.attr('ymd') 
		    	
		    	if (_self._clickCount ==2)
		    	{
		    		_self._clickCount = 0;
		    		resetDate(); //선택된 날짜를 클리어
		    		_self.$tbody.find("td.ui-restrict").addClass('ui-datepicker-unselectable ui-state-disabled'); //선택제한 날짜들을 선택금지처리
		    		_self._selectableDate = _self._maxRentDate;
		    		
		    		//라이센스 유효성관련
		    		checkLicenseInput11();
		    		return;
		    	}
		    	
		    	if (_self._clickCount == 0 || ymd < _self._selectFromDate)
		    	{
		    		
		    		_self._clickCount = 1;	
		    		_self._selectFromDate = ymd;
		    		_self.selectRange();
		    		
		    		var menu = $("#reservMenu .selected").text();
		    		 
		    		if($.trim(menu) == "제주예약") {
		    			_self._selectableDate = _self.addDates(ymd, 60); //선택가능한 날짜는 대여일로부터 60일로 변경
		    			_self.$tbody.find("td.ui-restrict").removeClass('ui-datepicker-unselectable ui-state-disabled'); //선택제한 날짜들을 선택금지해제
		    		} else {
		    			_self._selectableDate = _self.addDates(_self.addMonth(ymd, 1), -1);
		    			_self.make(0);
				    	_self.make(1);	
				    	_self.selectRange();
		    		}
		    		
		    		/*
		    		if(branchId !=  "000012")
		    		{
		    			if(_self._selectableDate >= "2019-05-31")
		    			{
		    				_self._selectableDate = "2019-05-31";
		    				$(".ui-icon-circle-triangle-w").click();
		    				$(".ui-icon-circle-triangle-e").click();
		    			}
		    		}
		    		*/
		    		return;
		    	}
		    	
		    	if (_self._clickCount == 1 && ymd > _self._selectFromDate)
		    	{
		    		if (ymd == _self._selectFromDate) return;
		    		
		    		if (ymd > _self._selectFromDate) 
		    			{
		    			_self._selectToDate = ymd;
		    			}
		    		else // 두번째 찍은 날짜가 대여일보다 이전이면 반납일을 먼저찍은 날짜(대여일), 대여일은 두번째 찍은 날짜로 변경
		    			{
		    			_self._selectToDate = _self._selectFromDate;
		    			_self._selectFromDate = ymd;
		    			}

		    		_self._clickCount = 2;
		    		_self.selectRange();
		    		
		    		_self._prevFromDate = _self._selectFromDate;
		    		_self._prevToDate = _self._selectToDate;
		    		_self._prevClickCount = 2;
		    		
		    		$('#sDate').val(_self._selectFromDate);
		    		$('#lDate').val(_self._selectToDate);		   		

		    		fn_changeDate(); // 비즈니스로직 호출
			 		$('#ui-datepicker-div').hide(600);
			 		$('#divOutside').hide();
			 		//라이센스 유효성관련
		    		checkLicenseInput11();
		    		
		    		if($("#userClass").val() != "1"){
						checkingLicenseIssued();	
					}
		    	}

		    });	    
		},
		dateFormat:function(date)
		{
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			return y + "-" + this.getDigitNum(m) + "-" + this.getDigitNum(d);
		},	
		toYmd:function(date)
		{
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			return y + "-" + this.getDigitNum(m) + "-" + this.getDigitNum(d);
		},
		toDate:function(ymd)
		{
			var y = ymd.substr(0,4);
			var m = parseInt(ymd.substr(5,2))-1;
			var d = ymd.substr(8,2);
			return new Date(y,m,d);
		},		
		getDigitNum:function (num) {	
		    return (num < 10) ? "0" + num : "" + num;	
		},
		
		getLastDate:function (mm, yyyy) {
		    if (mm == 1) //2월은 윤년에 따라 29일 또는 28일
		    {
		    	return (yyyy % 400 == 0 || (yyyy % 100 != 0 && yyyy % 4 == 0)) ? 29:28;
		    }
		    
		    //4,6,9,11월은 30일 그외는 31일
		    return (mm == 3 || mm == 5 || mm == 8 || mm == 10) ? 30: 31;
		},
		
		setDisabledDate:function (arr) {
			
			var _self = this;
			_self._disabledDateArr = arr;
			if (!_self.$tbody) return;
			
			//기존에 선택금지된 날짜가 지정되어 있으면 해제
			$(this._disabledDateArr).each(function (i, value)
			{
				_self.$tbody.find("[ymd='" + value + "']").removeClass('ui-datepicker-unselectable ui-state-disabled');
			});
			//새로 들어온 선택금지 날짜들을 선택금지 추가
			$(arr).each(function (i, value)
					{
						_self.$tbody.find("[ymd='" + value + "']").addClass('ui-datepicker-unselectable ui-state-disabled');
					});	

		},	
		
		init: function (classType)
		{
			var _self = this;		

			if (!calendar._isInit) // 초기화를 안했으면 렌더링
			{
				calendar._isInit = true;

				var cdiv =
					 '   <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-datepicker-multi ui-datepicker-multi-2" style="display: none;">  '  + 
					 '   <div class="ui-datepicker-group ui-datepicker-group-first">  '  + 
					 '   <div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-left">  '  + 
					 '   <a class="ui-datepicker-prev ui-corner-all ui-state-disabled" title="Prev"><span class="ui-icon ui-icon-circle-triangle-w">Prev</span></a>  '  + 
					 '   <div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>년&nbsp;<span class="ui-datepicker-month">3월</span></div>  '  + 
					 '   </div>  '  + 
					 '   <table class="ui-datepicker-calendar">  '  + 
					 '   <thead>  '  + 
					 '   <tr>  '  + 
					 '   <th scope="col" class="ui-datepicker-week-end"><span title="Sunday">일</span></th>  '  + 
					 '   <th scope="col"><span title="Monday">월</span></th>  '  + 
					 '   <th scope="col"><span title="Tuesday">화</span></th>  '  + 
					 '   <th scope="col"><span title="Wednesday">수</span></th>  '  + 
					 '   <th scope="col"><span title="Thursday">목</span></th>  '  + 
					 '   <th scope="col"><span title="Friday">금</span></th>  '  + 
					 '   <th scope="col" class="ui-datepicker-week-end"><span title="Saturday">토</span></th>  '  + 
					 '   </tr>  '  + 
					 '   </thead>  '  + 
					 '   <tbody></tbody>  '  + 
					 '   </table>  '  + 
					 '   </div>  '  + 
					 '   <div class="ui-datepicker-group ui-datepicker-group-last">  '  + 
					 '   <div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right">  '  + 
					 '   <a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="Next"><span class="ui-icon ui-icon-circle-triangle-e">Next</span></a>  '  + 
					 '   <div class="ui-datepicker-title"><span class="ui-datepicker-year">2018</span>년&nbsp;<span class="ui-datepicker-month">4월</span></div>  '  + 
					 '   </div>  '  + 
					 '   <table class="ui-datepicker-calendar">  '  + 
					 '   <thead>  '  + 
					 '   <tr>  '  + 
					 '   <th scope="col" class="ui-datepicker-week-end"><span title="Sunday">일</span></th>  '  + 
					 '   <th scope="col"><span title="Monday">월</span></th>  '  + 
					 '   <th scope="col"><span title="Tuesday">화</span></th>  '  + 
					 '   <th scope="col"><span title="Wednesday">수</span></th>  '  + 
					 '   <th scope="col"><span title="Thursday">목</span></th>  '  + 
					 '   <th scope="col"><span title="Friday">금</span></th>  '  + 
					 '   <th scope="col" class="ui-datepicker-week-end"><span title="Saturday">토</span></th>  '  + 
					 '   </tr>  '  + 
					 '   </thead>  '  + 
					 '   <tbody></tbody>  '  + 
					 '   </table>  '  + 
					 '   </div>  '  + 
					 '   <div class="ui-datepicker-row-break"></div>  '  + 
					 '  </div>  ' ; 
				
				$('body').append(cdiv);			
				
				if (classType)
				{
					$("#ui-datepicker-div").addClass("ui-datepicker-multi-2-" + classType);
				}
				
				_self.$tbody = $("table.ui-datepicker-calendar tbody");			
				_self.$year = $("span.ui-datepicker-year");
				_self.$month = $("span.ui-datepicker-month");						
				
				if (!_self._selectFromDate || !_self._selectToDate) //대여일이나 반납일 둘중에 하나라도 선택하지 않았으면
				{
					_self._selectFromDate = null; //대여일 선택안한거로 처리
					_self._clickCount = 0; // 클릭카운트는 0으로 초기화
					
					_self._pickDate = new Date();	
					_self._pickDate.setDate(1);	
				}
				else
				{
					_self._clickCount = 2;
					_self._pickDate = _self.toDate(_self._selectFromDate);
					_self._pickDate.setDate(1);				
				}				
			    _self.make(0);
			    _self.make(1);
			    _self.selectRange();
				this.addEvent();
				
				$('#ui-datepicker-div').show();
			}
			else
			{
				if (!_self._selectFromDate || !_self._selectToDate) //대여일이나 반납일 둘중에 하나라도 선택하지 않았으면
				{
					_self._selectFromDate = null; //대여일 선택안한거로 처리
					_self._clickCount = 0; // 클릭카운트는 0으로 초기화
					
					_self._pickDate = new Date();	
					_self._pickDate.setDate(1);
				}
				else //둘다 선택했었으면
				{
					_self._pickDate = _self.toDate(_self._selectFromDate);
					_self._pickDate.setDate(1);					
				}
				
		    	_self.make(0);
		    	_self.make(1);	
		    	_self.selectRange();
				
		    	//선택불가능한 날짜 처리
				$(this._disabledDateArr).each(function (i, value)
						{
							_self.$tbody.find("[ymd='" + value + "']").addClass('ui-datepicker-unselectable ui-state-disabled');
						});
				
				
				if ($('#divOutside').is(':visible'))
						{
					 		$('#ui-datepicker-div').hide();
					 		$('#divOutside').hide();
						}
				else
						{
							$('#ui-datepicker-div').show();
							$('#divOutside').show();
						}
			}
		}
	};
		
	$(document).on('click', 'td.ui-datepicker-today a', function() {
		//alert('예약은 익일(현시간에서 24시간 이후)부터 가능합니다.\n자세한 사항은 해당지점으로 문의바랍니다.');
	});

	/* 총대여기간 계산 */
	function calcTotalTime()
	{
		console.log( "VAL : ", $("#checkDtm").val() );
		if( $("#checkDtm").val() == "1" ){ 
			if(  $("#sDate").val() == closedDate){
				if(( closedHour.indexOf($("#sHour").val()) !== -1 )
					||( openMinute == "30" && $("#sHour").val() == openHour && $("#sMinute").val() == "00" )){
					$("#sHour").val(openHour);
					$("#sMinute").val(openMinute);
				}
			}
			if(  $("#lDate").val() == closedDate){
				if(( closedHour.indexOf($("#lHour").val()) !== -1 )
					||( openMinute == "30" && $("#lHour").val() == openHour && $("#lMinute").val() == "00" )){
					$("#lHour").val(openHour);
					$("#lMinute").val(openMinute);
				}
			}
		}
		
		var sDate = calendar._selectFromDate;
		var lDate = calendar._selectToDate;
		
		if (!sDate || !lDate)
		{
			 $('div.helper p').text("0일 0시간 0분");
			return;
		}
		
	     var sDateTime = calendar.toDate(sDate);
	     sDateTime.setHours($('#sHour').val());
	     sDateTime.setMinutes($('#sMinute').val());
	     
	     var lDateTime = calendar.toDate(lDate)
	     lDateTime.setHours($('#lHour').val());
	     lDateTime.setMinutes($('#lMinute').val());
	     
	     var oneDaytime = 86400000;
	     var diffTime = lDateTime - sDateTime;
	     var diffDate = Math.floor(diffTime / oneDaytime);
	     var diffHour = Math.floor((diffTime - diffDate * oneDaytime) / 3600000);
	     var diffMin = Math.floor((diffTime - diffDate * oneDaytime - diffHour * 3600000) / 60000);
	     
	     $('div.helper p').text(diffDate + "일 " + diffHour + "시간 " + diffMin + "분");
	}
	

	
	function resetDatePicker(disablledDateArr) // 선택할수 없는 날짜를 지정
	{
		calendar.setDisabledDate(disablledDateArr);
	}
	
	function resetDate() //달력 선택값을 초기화
	{
		console.log("call resetDate()");
		///console.log(resetDateArr);
		$("#sDate").val("");
		$("#lDate").val("");
		$("#lDate").removeClass("readonly");
		$("#lDate").addClass("readonly");
		$("#lHour").removeClass("disabled");
		$("#lHour").addClass("disabled");
		
		$('div.helper p').text("0일 0시간 0분");
		calendar._selectFromDate = null;
		calendar._selectToDate = null;
		calendar.selectRange();
	}
	
	// 달력 휴무일 표시
	function calendarHoliyDay()
	{
		$.getJSON("/resources/js/calendarHoliyDay.json", function(holiyDay){
			$(".ui-datepicker-calendar").find("tr td").each(function (i, value){
				for(var j=0; j<holiyDay.length; j++){
					if($(this).attr("ymd") == holiyDay[j].holiyDay){
						$(this).addClass(" ui-datepicker-week-end");
						$(this).attr("title", holiyDay[j].holiyDayName);
					}else{
						if( typeof $(this).attr("title") == "undefined" ){
							$(this).attr("title", $(this).attr("ymd"));	
						}
					}
				}
			});
		});
	}
