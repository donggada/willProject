<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!DOCTYPE html>
<meta charset="UTF-8">
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=0.38, minimum-scale=0.38, maximum-scale=1, user-scalable=yes" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>제주속으로 - 제주도 렌트카 가격비교 완전자차 할인</title>
<link rel="shortcut icon" href="/images/favicon.png">
<link rel="canonical" href="//jejussok.com/rent/rent.php?co=rent&n_media=27758&n_query=%EC%A0%9C%EC%A3%BC%EB%A0%8C%ED%84%B0%EC%B9%B4&n_rank=1&n_ad_group=grp-m001-01-000001089333339&n_ad=nad-a001-01-000000067466133&n_keyword_id=nkw-m001-01-000001109982503&n_keyword=%EC%A0%9C%EC%A3%BC%EB%A0%8C%ED%84%B0%EC%B9%B4&n_campaign_type=1&n_ad_group_type=1&NaPm=ct%3Dkekmqpnk%7Cci%3D0A40000WT4Tt2RM681nH%7Ctr%3Dsa%7Chk%3D2d0b202200a9cc0efc7e635aedea915cae2cbf7f">

<meta name="description" content="제주도 렌트카 가격비교 제주속으로 제주공항 렌트카 빠른 예약 인수"> 
<meta name="author" content="제주속으로 - 제주도 렌트카 가격비교 완전자차 할인"> 
<meta name="naver-site-verification" content="c54a4b3df136cbcf2d44f3adfaa889421ad1911d"/> 

<meta property="og:type" content="website">
<meta property="og:title" content="제주속으로 - 제주도 렌트카 가격비교 완전자차 할인">
<meta property="og:description" content="제주도 렌트카 가격비교 제주속으로 제주공항 렌트카 빠른 예약 인수">
<meta property="og:image" content="https://jejussok.com//files/img5.jpg">
<meta property="og:url" content="https://jejussok.com/">

<span itemscope="" itemtype="https://schema.org/Organization">
    <link itemprop="url" href="https://jejussok.com">
    <a itemprop="sameAs" href="https://www.facebook.com/come.jeju"></a>
    <a itemprop="sameAs" href="https://blog.naver.com/jejussok8666"></a>
    <a itemprop="sameAs" href="https://www.instagram.com/jejussok"></a>
    <a itemprop="sameAs" href="https://www.youtube.com/channel/UCXshjlX5ImGHYolU-FAnGBA"></a>
</span>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- <link href="/css/common.css" rel="stylesheet" type="text/css" charset="utf-8"/> -->
<link rel="stylesheet" type="text/css" charset="utf-8" href="/css/sub.css?ver=200717"/>

<!-- <link type="text/css" rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link type="text/css" rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link type="text/css" rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumpenscript.css">
<link type="text/css" rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumbrushscript.css"> -->

<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/popup.js" language="javascript"></script>

<SCRIPT LANGUAGE="JavaScript">
function search_form_check() {
    if(!document.search_form.search_name.value) {
        alert("상품명을 입력해주세요");
        document.search_form.search_name.focus();
        return false;
	}else{
		document.search_form.submit();
		return true;
	}
}
</script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
Kakao.init('2b2c233f0f0609fcf40a27a200c7a82d');
function loginWithKakao() {
    // 로그인 창을 띄웁니다.
    Kakao.Auth.login({
        success: function(authObj) {
            // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(res) {
                    AjaxCall(JSON.stringify(res));
                },
                fail: function(error) {
                    alert(JSON.stringify(error));
                }
            });
        },
        fail: function(err) {
            alert(JSON.stringify(err));
        }
    });
};

function AjaxCall(val) { 
    var sendData = {mode:'login', data:val};
    $.ajax({ 
        type: "post", 
        url : "/manager/ajax.kakao_login.php", 
        data: sendData, 
        dataType:"text", 
        success : function(data, status, xhr) {
            //alert(data);
            location.reload();
        }, 
        error: function(jqXHR, textStatus, errorThrown) { 
            alert(jqXHR.responseText); 
        } 
    });
}

function kakao_logout() {
    var sendData = {mode:'logout'};
    $.ajax({ 
        type: "post", 
        url : "/manager/ajax.kakao_login.php", 
        data: sendData, 
        dataType:"text", 
        success : function(data, status, xhr) {
            //alert(data);
            location.reload();
        }, 
        error: function(jqXHR, textStatus, errorThrown) { 
            alert(jqXHR.responseText); 
        } 
    });
}
</script>

</head>
<body oncontextmenu="return false">


<script type="text/javascript">
function getCookieLp( name ){
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
			endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 ) break;
	}
	return "";
}

var cnta=0;
cnta = 0;
var nameCok ="";
for (ca=0; ca<cnta; ca++){
	nameCok = "Popup10081"+eval(ca);
	
	if (getCookieLp( nameCok) != "done" ) {
		Show(document.getElementById('layerPopup'+eval(ca)));
	} else {
		Hide(document.getElementById('layerPopup'+eval(ca)));
	}
}

function Show(divid) {
	//divid.filters.blendTrans.apply();
	divid.style.visibility = "visible";
	//divid.filters.blendTrans.play();
}
function Hide(divid) {
	//divid.filters.blendTrans.apply();
	divid.style.visibility = "hidden";
	//divid.filters.blendTrans.play();
}
function setCookieLp(name, value, expiredays){
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function closeWinLp(get_Key) { 
	get_Pop = eval("document.all.Popup"+get_Key);
	get_Pop_id = "Popup"+get_Key;

	if (get_Pop.checked){
		setCookieLp(get_Pop_id,"done",1);
	}
	get_layerPopup = eval("document.all.layerPopup"+get_Key);
	get_layerPopup.style.display = 'none';
}
</SCRIPT>   <div class="top_banner">
	<div class="top_banner1"><img src="/images/top_banner1.png?ver=1" /></div>   
   </div>
  <div id="top">
  <div class="top_line" style="border-bottom:5px solid #fa6c16; position:absolute; width:100%; margin-top:150px;"></div>
   <div id="top_cont">
    <div id="top_menu">
                    <a id="custom-login-btn" href="javascript:loginWithKakao()"><img src="/images/kakao_login_btn_small.png?v=1" style="height:24px;margin:-5px 0 -8px 0;" /></a> &nbsp 
            <a href="javascript:" onclick="window.open('https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=h5cFtrFg4dgDLzKtFRfE&redirect_uri=https%3A%2F%2Fjejussok.com%2Fmanager%2Fnaver_callback.php&state=RAMDOM_STATE','naver','width=800,height=700,top=200,left=600')"><img src="/images/naver_login_btn_small.png?v=2" style="height:24px;margin:-5px 0 -8px 0;"/></a> &nbsp 
                <a href="/customer/customer_res.php?co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" class="confirm_btn">예약확인</a> &nbsp 
        <a href="/customer/customer.php?co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">고객센터</a> &nbsp
        <a href="tel:1566-8666">☎ 1566-8666</a>
    </div>
    <div id="logo"><a href="/index.php?PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee"><img src="/images/ssok/logo.png" style="border:0;" /></a></div>
	    <div class="top_srchbar">
        <form name="search_form" method="post" action="/search/search.php" onsubmit="return search_form_check()"><input type="hidden" name="PHPSESSID" value="76cfccbb5fa43c01230928fcb7f3e7ee" />
            <input type="text" name="search_name" style="outline:none" title="검색어 입력" value="" placeholder="상품명을 검색하세요"/>
            <a href="javascript:" onclick="search_form_check();" id="search_submit" style="cursor:pointer"><img src="/images/ssok/topsrch_btn.jpg" /></a>
        </form>
    </div>
    <div id="top_bn"><a href="/cu/cu_mo_sj.php?co=cu&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee"><img src="/files/t_img1.jpg"/></a></div>
   </div>
   <div id="nav">
    	<img src="/images/ssok/navtap_03.jpg" usemap="#Map" border="0" />
	    <map name="Map" id="Map">
      <area shape="rect" coords="3,10,136,55" href="/package/package.php?co=pack&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
      <area shape="rect" coords="137,10,270,55" href="/air/air.php?co=air&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
      <area shape="rect" coords="271,10,402,55" href="/rent/rent.php?co=rent&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
      <area shape="rect" coords="403,10,535,55" href="/lodge/lodge_sj.php?co=lodge&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
      <area shape="rect" coords="536,10,671,55" href="/cu/cu_mo_sj.php?co=cu&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
      <area shape="rect" coords="672,10,803,55" href="/group/group_sj.php?co=group&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
      <area shape="rect" coords="804,10,940,55" href="/customer/customer.php?co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
    </map>
   </div>
  </div>
<script type="text/javascript" src="/js/date2.js"></script>
<script type="text/javascript" src="/js/jquery.datePicker3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="/css/datePicker5.css">

<script type="text/javascript" charset="utf-8">
$(function()
{
   var monthNames = ['년 1 월','년 2 월','년 3 월','년 4 월','년 5 월','년 6 월','년 7 월','년 8 월','년 9 월','년 10 월','년 11 월','년 12 월']; 
	Date.monthNames = monthNames;
   var dayNames = ['일', '월', '화', '수', '목', '금', '토'];
	Date.dayNames = dayNames;
	k_date = "2020-09-02";
	r_date = "2020-09-02";
	r_date_e = "2020-09-03";
	if($('#r_date').val()==""){
		$('#r_date').val(r_date);
	}
	if($('#r_date_e').val()==""){
		$('#r_date_e').val(r_date_e);
	}
	
	$('#cal2')
		.datePicker({startDate:k_date})
		.datePicker({endDate:'2020-12-31'})
		.datePicker({inline:true})
		.dpSetSelected(r_date)
		.bind(
			'dateSelected',
			function(e, selectedDate, $td)
			{				
				$('#r_date').val(selectedDate.asString());
				$('#li_sdate').html(selectedDate.asString());
				$('#cal3').dpSetSelected(selectedDate.addDays(1).asString());	
				cal_term();
			}
		);
	$('#cal3')
		.datePicker({startDate:k_date})
		.datePicker({endDate:'2020-12-31'})
		.datePicker({inline:true})
		.dpSetSelected(r_date_e)	
		.bind(
			'dateSelected',
			function(e, selectedDate, $td)
			{
				$('#r_date_e').val(selectedDate.asString());
				$('#li_edate').html(selectedDate.asString());
				if($('#r_date').val()>$('#r_date_e').val()) {
					alert("반납일이 인수일보다 늦어야 합니다.");
					var r_date = new Date($('#r_date').val());
					r_date.addDays(1);
					var r_date_e = r_date.getFullYear()+"-"+(r_date.getMonth()+1)+"-"+r_date.getDate();
					$('#cal3').dpSetSelected(r_date_e);
					$('#r_date_e').val(r_date_e);
					
					var r_e_hour = $('select[name="r_hour"]').val();
					$('select[name="r_e_hour"]').val(r_e_hour);
				}
				cal_term();
			}
		);
		
    fLoadData_amt(0,0);
});

function fLoadData_amt(gcode, asort)
{
    cal_term();
    
    $.ajax({
        type: "POST",
        url: "./car_amt.php",
        data: "r_date="+encodeURIComponent($('#r_date').val())+"&r_e_date="+encodeURIComponent($("#r_date_e").val())+"&r_hour="+$('select[name="r_hour"]').val()+"&r_minute="+$('select[name="r_minute"]').val()+"&r_e_hour="+$('select[name="r_e_hour"]').val()+"&r_e_minute="+$('select[name="r_e_minute"]').val()+"&c_quantity="+$('select[name="c_quantity"]').val()+"&gcode="+encodeURIComponent(gcode)+"&asort="+asort,
        success: function(resultText)
        {				
            $('#car_list').html(resultText);
            var r_date_e = $("#r_e_date").val();
            $('#r_date_e').val(r_date_e);
            $('#cal3').dpSetSelected(r_date_e);
        },
        error: function() {
            alert("호출에 실패했습니다.");
        }
    });
}

$(document).ready(function($)
{
	// 페이지가 로딩될 때 'Loading 이미지'를 숨긴다.
	$('#viewLoading').hide();

	// ajax 실행 및 완료시 'Loading 이미지'의 동작을 컨트롤하자.
	$('#viewLoading')
	.ajaxStart(function()
	{
		// 로딩이미지의 위치 및 크기조절	
		$('#viewLoading').css('position', 'absolute');
		$('#viewLoading').css('left', $('#car_list').offset().left);
		$('#viewLoading').css('top', $('#car_list').offset().top);
		$('#viewLoading').css('width', $('#car_list').css('width'));
		$('#viewLoading').css('height', $('#car_list').css('height'));

		//$(this).show();
		$(this).fadeIn(500);
	})
	.ajaxStop(function()
	{
		//$(this).hide();
		$(this).fadeOut(500);
	});
});

function cal_term() {
	date_s1 = $("#r_date").val();
	date_e1 = $("#r_date_e").val();
	date_s = date_s1.split("-");  
	date_e = date_e1.split("-");  
  //alert(date_s[1]);
	y1=eval(date_s[0]);
	m1=eval(date_s[1]-1);
	d1=eval(date_s[2]);
	h1=eval($('select[name="r_hour"]').val());
	i1=eval($('select[name="r_minute"]').val());
	y2=eval(date_e[0]);
	m2=eval(date_e[1]-1);
	d2=eval(date_e[2]);
	h2=eval($('select[name="r_e_hour"]').val());
	i2=eval($('select[name="r_e_minute"]').val());

	today=new Date();
	day1=new Date(y1,m1,d1,h1,i1,0,0);
	day2=new Date(y2,m2,d2,h2,i2,0,0);

	if(day1<today) { 
		alert("현재 시간 이전 예약은 불가능합니다.");
        var r_hour = today.getHours() + 2;
		$('select[name="r_hour"]').val(r_hour);
		$('select[name="r_e_hour"]').val('');
		return false;
	}

	todate=today.getTime()-60*60*24*1000;
	date1=day1.getTime();
	date2=day2.getTime();
	term2=Math.ceil((date2-date1)/60/60/1000);
	
	if(term2<1) {
		//alert("1시간 이내 예약은 불가능합니다.");
		//$('select[name="r_hour"]').val('');
		var r_hour = $('select[name="r_hour"]').val();
		var r_e_hour = eval(r_hour)+1;
		$('select[name="r_e_hour"]').val(r_e_hour);
		return false;
	}
	
	/* day3=new Date(y1,m1,d1,0,0,0,0);
	day4=new Date(y2,m2,d2,0,0,0,0);
	date3=day3.getTime();
	date4=day4.getTime();
	day_term=Math.ceil((date4-date3)/60/60/1000/24);
	if(day_term>=7) {
		alert("7일 이상의 예약은 전화문의 바랍니다.");
		var r_date = new Date($('#r_date').val());
		r_date.addDays(6);
		var r_date_e = r_date.getFullYear()+"-"+(r_date.getMonth()+1)+"-"+r_date.getDate();
		$('#cal3').dpSetSelected(r_date_e);
		$('#r_date_e').val(r_date_e);
		return false;
	} */
	if(h1<10) h1 = "0"+h1;
	if(i1<10) i1 = "0"+i1;
	var stime = h1+":"+i1;
	$("#li_stime").html(stime);

	if(h2<10) h2 = "0"+h2;
	if(i2<10) i2 = "0"+i2;
	var etime = h2+":"+i2;
	$("#li_etime").html(etime);

	$("#term").val(term2);
	//return term2;
}
</script>

<div id="wrap">
  <div id="main_contents">
    <!--<div id="best_po_tap2" style="padding-left:43px;">
     <img src="../images/ssok/bustaxi_tap_01.jpg" usemap="#Map5" id="Image1" border="0" />
     <map name="Map5" id="Map5">
       <area shape="rect" coords="2,4,146,44" href="/rent/rent.php?co=rent"/&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee>
       <area shape="rect" coords="149,2,296,44" href="/rent/rent_bus.php?co=rent"/&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee>
       <area shape="rect" coords="298,3,443,45" href="/rent/rent_taxi.php?co=rent&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
     </map>
    </div>-->

   <div id="res2" style="margin-top:15px !important; height:315px;">
    <div id="res_search2">
    <div class="">
      <div class="res_box2" style="width:342px; height:217px; margin-top:0px; margin-left:0px;">	
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
       <tr>
        <td colspan="3" style="text-align:left;">
		<div class="res_step">
        	<ul>
            	<li><p>1</p> 인수일</li>
            </ul>
        </div>
		</td>
       </tr>
       <tr>
        <td colspan="3">
         <div id="cal2" style="height:271px;"></div>
        </td>
       </tr>
      </table>
     <div class="rent_time2">인수시간 선택 ▶  
      	<SELECT name="r_hour" id="r_hour" onChange="cal_term(this.form);return false;">
		<OPTION value=8 >8시</option><OPTION value=9 >9시</option><OPTION value=10 >10시</option><OPTION value=11 selected>11시</option><OPTION value=12 >12시</option><OPTION value=13 >13시</option><OPTION value=14 >14시</option><OPTION value=15 >15시</option><OPTION value=16 >16시</option><OPTION value=17 >17시</option><OPTION value=18 >18시</option><OPTION value=19 >19시</option><OPTION value=20 >20시</option><OPTION value=21 >21시</option><OPTION value=22 >22시</option>		</SELECT>
		<SELECT name="r_minute" id="r_minute" onChange="cal_term(this.form);return false;">
		<OPTION value=0 selected>0분</option><OPTION value=30 >30분</option>		</SELECT>
      <!--부터-->
     </div>
   </div>
   <div class="res_box2" style="width:342px; height:217px; margin-left:-1px;">
        <!--<img src="../images/ssok/resbox02.jpg" />-->
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
       <tr>
        <td colspan="3" style="text-align:left;">
		<div class="res_step">
        	<ul>
            	<li><p>2</p> 반납일</li>
            </ul>
        </div>
		</td>
       </tr>
      
       <tr>
        <td colspan="3">
         <div id="cal3" style="height:271px;"></div>
        </td>
       </tr>
      </table>
      <div class="rent_time2">반납시간 선택 ▶   
		<SELECT name="r_e_hour" id="r_e_hour"   onChange="cal_term(this.form);return false;">
		<OPTION value=7 >7시</option><OPTION value=8 >8시</option><OPTION value=9 >9시</option><OPTION value=10 >10시</option><OPTION value=11 selected>11시</option><OPTION value=12 >12시</option><OPTION value=13 >13시</option><OPTION value=14 >14시</option><OPTION value=15 >15시</option><OPTION value=16 >16시</option><OPTION value=17 >17시</option><OPTION value=18 >18시</option><OPTION value=19 >19시</option><OPTION value=20 >20시</option>		</SELECT>
		<SELECT name="r_e_minute" id="r_e_minute" onChange="cal_term(this.form);return false;"  >
		<OPTION value=0 selected>0분</option><OPTION value=30 >30분</option>		</SELECT>
      <!--까지-->
     </div>
   </div>
   </div>

		<div class="res_step">
        	<ul>
            	<li><p>3</p> 일정확인</li>
            </ul>
        </div>
	<div class="res_schedule">
	
     <div>
	 <div class="res_schedule_time">
		<ul>
			<li><span id="li_sdate">2020-09-02</span> (<span id="li_stime">11:</span>) ~</li>
			<li><span id="li_edate">2020-09-03</span> (<span id="li_etime">11:</span>) &nbsp&nbsp</li>
		</ul>
	</div>
     <p>이용시간</p>
     <input name="term" id="term" class="input-text" type="text">

      <p>차량대수</p>
          <select name="c_quantity" class="slt">
		<option value='1' selected>1 대</option><option value='2' >2 대</option><option value='3' >3 대</option><option value='4' >4 대</option><option value='5' >5 대</option><option value='6' >6 대</option><option value='7' >7 대</option><option value='8' >8 대</option><option value='9' >9 대</option>		</select>
     </div>
	

     <a href="javascript:fLoadData_amt(0,0);"><div class="sc_btn"> 검색하기<!--<img src="../images/ssok/sc_btn.jpg" />--></div></a>
    </div>
    <!--<div class="res_notice" style="text-align:right; font-size:11px; color:#666; margin-top:50px; font-weight:bold; padding-right:20px;">*네비게이션/유모차/카시트는 무료로 제공되지만 수량이 한정되어 있으므로, 미리 상담원에게 요청하여 주십시오.</div>-->
   </div>
   </div>
   <input type="hidden" id="r_date" name="r_date" value="">
   <input type="hidden" id="r_date_e" name="r_date_e" value="">
 <!--<div style=" width: 934px; height:91px; margin:0 auto; margin-top:10px;">-->
 <div style=" width:896px; height:41px; margin:0 auto; margin-top:64px; border-bottom:1px solid #d3d3d3; background:#eeeeee; text-align:center; line-height:41px; font-size:13px; color:#f8451a; font-weight:bold;">
  <!--<img src="../images/q_rent.jpg?ver=1">-->
  <div class="txt01">※차량목록은 잔여여부와 무관하게 보유차량이 보여집니다. 예약요청후 상담을 통해 예약확정됩니다.</div>
 </div>
	<div style="text-align:center;">
	<img src="/files/1598579605.jpg">
    </div>
    <!-- 상품 불러오는 곳-->
  <div id="car_list"></div>
  <div id="viewLoading" style="margin-top:-311px;position:absolute;display:none;text-align:center;">
	<img src="../images/loading.gif" />
  </div>
  <!--상품 불러오는 곳 끝-->
   </div>
  </div>
  

<script>
window.onload = function() {
    cal_term();
}
</script>

<!-- AceCounter Log Gathering Script V.8.0.2019080601 -->
<script language='javascript'>
    var _AceGID=(function(){var Inf=['gtc4.acecounter.com','8080','LS2S39144459823','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.    join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
    var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0    ].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src=(location.protocol.indexOf('http')==0?location.protocol:'http:')+'//cr.acecounter.com/Web/AceCounter_'+_C    +'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
</script>
<noscript><img src='http://gtc4.acecounter.com:8080/?uid=LS2S39144459823&je=n&' border='0' width='0' height='0' alt=''></noscript>
<!-- AceCounter Log Gathering Script End -->

<!-- 네이버 애널리틱스 --> 
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_13397dc32147";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>
<!-- 디자인제주 -->
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "18442289fd0b5";
wcs_do();
</script>
<!-- 빌드업 -->
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "558a73329dcec8";
wcs_do();
</script>

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '186007571967290'); 
fbq('track', 'PageView');
</script>
<noscript>
<img height="1" width="1" 
src="https://www.facebook.com/tr?id=186007571967290&ev=PageView
&noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->

<!-- WIDERPLANET  SCRIPT START 2020.3.16 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",   /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
				*주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"20754",	/*광고주 코드 */
		ty:"Home",	/*트래킹태그 타입 */
		device:"web"	/*디바이스 종류  (web 또는  mobile)*/		
	};
}));
</script>
<script type="text/javascript" async src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2020.3.16 -->

<!-- 모비온 Enliple Common Tracker v3.6 [공용] start -->
<script type="text/javascript">
function mobRf() {
    var rf = new EN();
    rf.setData("userid", "jejussok");
    rf.setSSL(true);
    rf.sendRf();
}
</script>
<script src="https://cdn.megadata.co.kr/js/en_script/3.6/enliple_min3.6.js" defer="defer" onload="mobRf()"></script>
<!-- Enliple Common Tracker v3.6 [공용] end -->

<!-- 니트머스 -->
<!-- <script type="text/javascript" src="https://q.nitmus.com/persona.js" data-id="AANed01VTNyT7wbk7cMMWA" ></script> -->

<!-- Global site tag (gtag.js) - Google Ads: 971892596 --> 
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-971892596"></script> 
<script> 
    window.dataLayer = window.dataLayer || []; 
    function gtag(){dataLayer.push(arguments);} 
    gtag('js', new Date()); 
    gtag('config', 'AW-971892596'); 
</script> 
</div>

<div id="footer">
	<div id="copy">
		<img src="https://jejussok.com/images/ssok/copy.jpg" usemap="#footMap4" border="0" />
		<map name="footMap4" id="footMap4">
          <area shape="rect" coords="438,4,491,27" href="/company/greeting.php?PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
		  <area shape="rect" coords="200,5,310,28" href="javascript:;" onclick="poppri();"/>
		  <area shape="rect" coords="320,4,430,27" href="javascript:;" onclick="poppol();"/>
		</map>
	</div>
</div>

<script language="javascript">
function poppri(){
    window.open("/inc/pop_privacy.html","pop_pri","scrollbars=no,width=620,height=660,left=350,top=150");
}
function poppol(){
    window.open("/inc/pop_policy.html","pop_pol","scrollbars=no,width=620,height=660,left=350,top=150");
}
</script>

<!--팝업-->
<script>
<!-- 
function getCookie( name ) { 
	var nameOfCookie = name + "="; 
	var x = 0; 
	while ( x <= document.cookie.length ) { 
		var y = (x+nameOfCookie.length); 
		if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
					 if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
									 endOfCookie = document.cookie.length; 
					 return unescape( document.cookie.substring( y, endOfCookie ) ); 
		} 
		x = document.cookie.indexOf( " ", x ) + 1; 
		if ( x == 0 ) 
		break; 
	} 
	return "";
}
function setCookie( name, value, expiredays ) { 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 

function closeWin(pop_str) { 
	setCookie(pop_str, "done" , 1); 
	document.getElementById(pop_str).style.display='none'; 
} 
// -->
</script>


<style>
li {list-style:none;}
table { border-collapse:collapse;}

.QuickTop { width:70px; position:absolute; left:50%; margin-left:-610px; top:250px; height:270px; z-index:1;}

.QuickTop .quick_bus { margin-left:-1px; margin-top:15px;}
.QuickTop .quick_rankey { margin-left:3px; margin-top:5px;}

.QuickTop2 { width:114px;position:absolute; left:50%; margin-left:480px; top:250px; z-index:1; background:url(../images/ssok/quick_bg.jpg) no-repeat; padding-top:10px;}
.QuickTop2 .recent { width:93px; height:351px;padding:4px; margin-left:16px;}
.QuickTop2 .recent .top {width:88px; height:24px; margin:20px auto 0;}
.QuickTop2 .recent .pro table {width:100%; text-align:center; border:none;}
.QuickTop2 .recent .pro table .name
{ height:25px; color:#666; font-size:11px; letter-spacing:-1px; font-family:"나눔고딕"; }
.QuickTop2 .recent .pro table .thumb {text-align:center; padding-left:10px;}
.QuickTop2 .hotel { width:95px; height:373px; padding:3px;}
.QuickTop2 .hotel .top {width:88px; height:28px; margin:0 auto;}
.QuickTop2 .hotel .banner .ban {width:94px; text-align:center; margin:0 auto; padding-left:2px;}

.QuickTop3 { width:176px;position:absolute; left:50%; margin-left:480px;top:250px; z-index:1; padding-top:10px; border:1px solid #d8d8d8; padding-bottom:8px;}
.QuickTop3 .quick_right { width:147px; margin:0 auto;}

.QuickTop3_bottom { display:block; position:relative;width:176px;  border-top:1px solid #d8d8d8;height:64px; line-height:64px; text-align:center; margin-top:10px;}
.QuickTop3_bottom ul { }
.QuickTop3_bottom ul li { font-size:16px; margin-left:10px;}

 .right_srchbar {width:100%; height:33px; float: left; position:relative; /*top:43px; left:130px;*/ /*background-image: url(/images/ssok/topsrch.jpg); background-repeat:no-repeat;*/ border-bottom:1px solid #b4b4b4; margin-bottom:20px; margin-top:20px;}
 .right_srchbar input{width:80%;height:33px;/*margin-left:12px;*/border:0;background:transparent;font-size:12px;line-height:29px;color:#666;letter-spacing:-0.5px;outline:none;font-family:"나눔고딕";}
 .right_srchbar img {position:absolute;top:5px;right:2px;width:20px;height:21px; vertical-align:middle;}

#youtube_div .youtube_close {background:url(/images/youtube_close.gif) center center no-repeat; width:35px; height:35px; text-indent:-99999px}
</style>

<script>
/* function quick_b(p_no,gotopage){
	$.ajax({
		type: "POST",
		url: "/inc/new_list.php",
		data: "p_no="+p_no+"&gotopage="+gotopage+"&c_id=",
		success: function(resultText)
		{
			//alert(resultText);
			$('#paging_container1').html(resultText);
			
		},
		error: function() {
			alert("호출에 실패했습니다.");
		}
	});
}
function print_pop2(){
	window.open("/print_pop.php","pop",'scrollbars=no,status=no,toolbar=no,menu=no,width=700,height=245');
}
quick_b(0,1); */
</script>

<!--<div class="QuickTop" id="quickMenu">
  <img src="../images/ssok/quick_right.jpg" usemap="#quick" border="0" />
<map name="quick" id="quick">
    <area shape="rect" coords="8,239,121,268" href="/customer/qna/list.php?table=board_qna&co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
    <area shape="rect" coords="8,431,126,595" href="javascript:print_pop();" />
  </map>
 </div>-->
 
 <!--<div class="QuickTop" id="quickMenu">
  <a href="javascript:print_pop2();">
  <img src="/images/ssok/quick_5000.jpg" usemap="#quick" border="0" /></a>
 </div>-->
 <div class="QuickTop" id="quickMenu">
	<img src="/files/1594787699.jpg" class="quick_rankey">
  <!--<a href="http://jejussok.com/cu/cu_mo_sj.php?co=cu" target="new" style="display:block; width:70px; height:243px;">
  <img src="/images/ssok/quick_70.jpg" usemap="#quick" border="0"></a>-->
  
  <a href="/rent/rent_bus.php?co=rent&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee"><img src="/images/ssok/quick_bus.png" usemap="#quick" border="0" class="quick_bus"></a>
  <!--<a href="/group/package.php?PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee"><img src="/images/quick_left01.jpg" style="margin:10px 0 0 5px"></a>-->
 </div>
 
 
<!--<div class="QuickTop2" id="quickMenu2">
		
	<div class="sns_ic">
		<ul>
			<a href="https://blog.naver.com/jejussok8666" target="_blank"><li><img src="/images/blog_icon.png" title="네이버블로그"></li></a>
			<a href="https://www.facebook.com/come.jeju/" target="_blank"><li><img src="/images/facebook_icon.png" title="페이스북"></li></a>
			<a href="https://www.instagram.com/jejussok/" target="_blank"><li><img src="/images/insta_icon.png" title="인스타그램"></li></a>
		</ul>
	</div>
 	
  <div style="width:122px; height:400px; padding-left:8px;">
   <img src="/images/ssok/quick_image.jpg" usemap="#Map5" border="0" />
   <map name="Map5" id="Map5">
     <area shape="rect" coords="3,228,112,255" href="/customer/qna/list.php?table=board_qna&co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee" />
       <script>
	 var uam = window.navigator.userAgent.toLowerCase();

	if ( /iphone/.test(uam) || /android/.test(uam) || /opera/.test(uam) || /bada/.test(uam) ) {
		document.write('<area shape="rect" coords="0,114,116,184" href="tel:15668666" />');
	}     
	 </script>
   </map>
  </div>
  <div class="recent">
   <div class="top">
    <img src="/images/ssok/q_re_top.jpg" />
   </div>
   <div id="paging_container1" style="height:400px;">
   </div>	
  </div>
</div>-->



<div class="QuickTop3" id="quickMenu2">
	<div class="quick_right">
   	  <div class="right_srchbar">
            <form name="search_form2" method="post" action="/search/search.php" onsubmit="return search_form_check2()"><input type="hidden" name="PHPSESSID" value="76cfccbb5fa43c01230928fcb7f3e7ee" />
                <input type="text" name="search_name" style="outline:none" title="검색어 입력" value="" placeholder="상품명을 검색하세요"/>
                <a href="javascript:" onclick="search_form_check2();" id="search_submit" style="cursor:pointer"><img src="/images/rightsrch_btn.png" /></a>
            </form>
        </div>
    	
        <div class="quick_right_img">
        	<img src="/images/quick_right01.gif" usemap="#quick_right01">
            <map name="quick_right01" id="quick_right01">
            	<area shape="rect" coords="18,9,71,79" href="/customer/after/list.php?table=board_notice&co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            	<area shape="rect" coords="82,9,135,79" href="/customer/qna/list.php?table=board_qna&co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            	<area shape="rect" coords="18,87,71,157" href="/customer/customer_res.php?co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            	<area shape="rect" coords="82,87,135,157" href="/customer/customer_r.php?PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            </map>
        	<!-- 제주여행정보 : 2019-12-11 삭제
            <img src="/images/quick_right01.jpg" usemap="#quick_right01">
            <map name="quick_right01" id="quick_right01">
            	<area shape="rect" coords="18,9,71,79" href="/customer/after/list.php?table=board_notice&co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            	<area shape="rect" coords="82,9,135,79" href="/customer/qna/list.php?table=board_qna&co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            	<area shape="rect" coords="18,87,71,157" href="/customer/customer_res.php?co=cs&PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            	<area shape="rect" coords="82,87,135,157" href="/customer/customer_r.php?PHPSESSID=76cfccbb5fa43c01230928fcb7f3e7ee">
            	<area shape="rect" coords="18,170,135,192" href="https://www.visitjeju.net/kr/festival/list?menuId=DOM_000001718007000000" target="_blank">
            </map> -->
            <img src="/images/quick_right02.jpg" usemap="#quick_right02">
            <map name="quick_right02" id="quick_right02">
            	<area shape="circle" coords="117,161,18" href="https://www.instagram.com/jejussok/" target="_blank">
            	<area shape="circle" coords="76,161,18" href="https://www.facebook.com/come.jeju/" target="_blank">
				<area shape="circle" coords="35,161,18" href="https://blog.naver.com/jejussok8666" target="_blank">
                <area shape="rect" coords="1,52,146,134" href="javascript:" onclick="$('#youtube_div').show()">
            </map>
        </div>
               
    </div>
    <div class="QuickTop3_bottom">
        <ul>
            <a href="#"><li>TOP</li></a>
        </ul>
	</div>
</div>

<div id="youtube_div" style="position:fixed;top:50%;left:50%;margin-top:-100px;margin-left:-79px;z-index:9999999;display:none;">
<a href="javascript:void(0);" onclick="$('#youtube_div').hide()" id="close"><div style="float:right;" class="youtube_close">Close</div></a>
<iframe width="560" height="315" src="https://www.youtube.com/embed/UWN_16rjJ-M?rel=0&wmode=opaque&autohide=1&autoplay=0&controls=1&modestbranding=1&showinfo=1&enablejsapi=1&version=3&playerapiid=ytplayer&loop=1&mute=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>


<script>
embed=$('#youtube_div').html();

$('#close').click(function(){
 status=$(this).text()
  if(status=='닫기'){$('#youtube_div').html(''); $(this).text('열기');}
  else{$('#youtube_div').html(embed); $(this).text('닫기'); }
});
</script>


<SCRIPT LANGUAGE="JavaScript">
function search_form_check2() {			
    if(document.search_form2.search_name.value=='') {
        alert("상품명을 입력해주세요");
        document.search_form2.search_name.focus();
        return false;
	}else{
		document.search_form2.submit();
		return true;
	}
}
$(document).ready(function() { 
	$('#favorite').on('click', function(e) { 
		var bookmarkURL = window.location.href; 
		var bookmarkTitle = document.title; 
		var triggerDefault = false; 
		if (window.sidebar && window.sidebar.addPanel) { 
			// Firefox version < 23 
			window.sidebar.addPanel(bookmarkTitle, bookmarkURL, ''); 
		} else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) { 
			// Firefox version >= 23 and Opera Hotlist 
			var $this = $(this); 
			$this.attr('href', bookmarkURL); 
			$this.attr('title', bookmarkTitle); 
			$this.attr('rel', 'sidebar'); 
			$this.off(e); triggerDefault = true; 
		} else if (window.external && ('AddFavorite' in window.external)) { 
			// IE Favorite 
			window.external.AddFavorite(bookmarkURL, bookmarkTitle); 
		} else { 
			// WebKit - Safari/Chrome 
			alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.'); 
		} 
		return triggerDefault; 
	}); 
});
</script>


<script type="text/javascript">
$(window).scroll(function(){

	var scrollTop = $(document).scrollTop();
	var hval = $(document).height();


	if (scrollTop < 250) {
	
	scrollTop = 250 ;
	
	}else if (scrollTop > (hval - 880) ) {
		scrollTop= hval - 880;
	}
	
	$("#quickMenu").stop();
	$("#quickMenu").animate( { "top" : scrollTop });
});

$(window).scroll(function(){

	var scrollTop = $(document).scrollTop();
	var hval = $(document).height();

	if (scrollTop < 250) {	
		scrollTop = 250 ;
	}else if (scrollTop > (hval - 880) ) {
		scrollTop= hval - 880;
	}
	$("#quickMenu2").stop();
	$("#quickMenu2").animate( { "top" : scrollTop });

});
</script>
<!-- AceCounter Log Gathering Script V.8.0.2019080601 -->
<script language='javascript'>
    var _AceGID=(function(){var Inf=['gtc4.acecounter.com','8080','LS2S39144459823','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.    join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
    var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0    ].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src=(location.protocol.indexOf('http')==0?location.protocol:'http:')+'//cr.acecounter.com/Web/AceCounter_'+_C    +'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
</script>
<noscript><img src='http://gtc4.acecounter.com:8080/?uid=LS2S39144459823&je=n&' border='0' width='0' height='0' alt=''></noscript>
<!-- AceCounter Log Gathering Script End -->

<!-- 네이버 애널리틱스 --> 
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_13397dc32147";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>
<!-- 디자인제주 -->
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "18442289fd0b5";
wcs_do();
</script>
<!-- 빌드업 -->
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "558a73329dcec8";
wcs_do();
</script>

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '186007571967290'); 
fbq('track', 'PageView');
</script>
<noscript>
<img height="1" width="1" 
src="https://www.facebook.com/tr?id=186007571967290&ev=PageView
&noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->

<!-- WIDERPLANET  SCRIPT START 2020.3.16 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",   /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
				*주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"20754",	/*광고주 코드 */
		ty:"Home",	/*트래킹태그 타입 */
		device:"web"	/*디바이스 종류  (web 또는  mobile)*/		
	};
}));
</script>
<script type="text/javascript" async src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2020.3.16 -->

<!-- 모비온 Enliple Common Tracker v3.6 [공용] start -->
<script type="text/javascript">
function mobRf() {
    var rf = new EN();
    rf.setData("userid", "jejussok");
    rf.setSSL(true);
    rf.sendRf();
}
</script>
<script src="https://cdn.megadata.co.kr/js/en_script/3.6/enliple_min3.6.js" defer="defer" onload="mobRf()"></script>
<!-- Enliple Common Tracker v3.6 [공용] end -->

<!-- 니트머스 -->
<!-- <script type="text/javascript" src="https://q.nitmus.com/persona.js" data-id="AANed01VTNyT7wbk7cMMWA" ></script> -->

<!-- Global site tag (gtag.js) - Google Ads: 971892596 --> 
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-971892596"></script> 
<script> 
    window.dataLayer = window.dataLayer || []; 
    function gtag(){dataLayer.push(arguments);} 
    gtag('js', new Date()); 
    gtag('config', 'AW-971892596'); 
</script> 
</body>
</html>