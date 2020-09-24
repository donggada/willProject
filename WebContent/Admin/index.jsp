<%@page import="book.vo.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>
        <link href="Admin/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    	<link href="QnA/QnA11/bootstrap.css" rel="stylesheet">
		<link href="QnA/QnA11/bootstrap.min.css" rel="stylesheet">
    </head>
  <%
  ArrayList<BookBean> Statslist= (ArrayList<BookBean>)request.getAttribute("Statslist"); 
  ArrayList<BookBean> Monthlist= (ArrayList<BookBean>)request.getAttribute("Monthlist"); 
  ArrayList target=new ArrayList();
  ArrayList count= new ArrayList();
  if(Statslist!=null){
  for(int i = 0; i < Statslist.size(); i++){
  	target.add("'"+Statslist.get(i).getBook_date() +"'");
  	count.add(Statslist.get(i).getBook_price());
 	 }
  }
  %>  
    <jsp:include page="/inc/topleft.jsp"></jsp:include>
    
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">관리자 페이지</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">현재&ensp; 매출액은&emsp; </li>
                            <li><%=Monthlist.get(0).getBook_price()%>만원&ensp; 입니다</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">회원관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="MemberList.ad">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">차량관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="CarList.ad">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">게시판관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="QnABoard.ad">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">매출현황</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="sellinglist.ad">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        Area Chart Example(월별매출)
                                    </div>
                                    <div class="card-body"><canvas id="lineChart" width="500" height="300"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        Bar Chart Example(월별매출)
                                    </div>
                                    <div class="card-body"><canvas id="barChart" width="500" height="300"></canvas></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted"></div>
                            <div>
                                <a href="#">ITWILL-PROJECT</a>
                                &middot;
                                <a href="#"> 5CLASS &amp; 3 </a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
       <script type="text/javascript">
       var target=<%=target%>
       var count=<%=count%>
		// 막대그래프 스크립트
       var myBarChartctx = document.getElementById('barChart');
   	var myBarChart = new Chart(myBarChartctx, {
   	    type: 'bar',
   	    data: {
   			labels: target,
   			datasets: [{
   				label: "Bar Graph",
   				data: count,
   				backgroundColor: [
   						'rgba(0, 0, 0, 0)'
   				],
   				borderColor: [
   						'rgba(255, 99, 132, 1)',
   						'rgba(54, 162, 235, 1)',
   						'rgba(255, 206, 86, 1)',
   						'rgba(75, 192, 192, 1)',
   						'rgba(153, 102, 255, 1)',
   						'rgba(255, 159, 64, 1)'
   				],
   				borderWidth: 3
   			}]
   		},
   		options: {
   			legend:false,
   			render: 'value',
   			responsive: false,
   			tooltips: {
   				enabled: false
   			},
   			hover: {
   				animationDuration: 0
   			},
   			animation: {
   				duration: 1,
   				onComplete: function () {
   					var chartInstance = this.chart,
   						ctx = chartInstance.ctx;
   					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
   					ctx.fillStyle = 'purple';
   					ctx.textAlign = 'center';
   					ctx.textBaseline = 'bottom';

   					this.data.datasets.forEach(function (dataset, i) {
   						var meta = chartInstance.controller.getDatasetMeta(i);
   						meta.data.forEach(function (bar, index) {
   							var data = dataset.data[index];							
   							ctx.fillText(data, bar._model.x, bar._model.y-5);
   							
   						});
   					});
   				}
   			},
   			scales: {
   				yAxes: [{
   					ticks: {
   						beginAtZero: true,
   						stepSize : 1500,
   						fontSize : 14,
   					}
   				}]
   			}
   		}
   	});
   	
   	//곡선그래프 스크립트
   	var myAreaChartctx = document.getElementById('lineChart');
   	var myAreaChart = new Chart(myAreaChartctx, {
   	    type: 'line',
   	    data: {
   			labels: target,
   			datasets: [{
   				label: 'Line Graph',
   				data: count,
   				backgroundColor: [
   						'rgba(0, 0, 0, 0)'
   				],
   				borderColor: [
   						'rgba(255, 99, 132, 1)',
   						'rgba(54, 162, 235, 1)',
   						'rgba(255, 206, 86, 1)',
   						'rgba(75, 192, 192, 1)',
   						'rgba(153, 102, 255, 1)',
   						'rgba(255, 159, 64, 1)'
   				],
   				borderWidth: 3
   			}]
   		},
   		options: {
   			legend:false,
   			render: 'value',
   			responsive: false,
   			tooltips: {
   				enabled: false
   			},
   			hover: {
   				animationDuration: 0
   			},
   			animation: {
   				duration: 1,
   				onComplete: function () {
   					var chartInstance = this.chart,
   						ctx = chartInstance.ctx;
   					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
   					ctx.fillStyle = 'purple';
   					ctx.textAlign = 'center';
   					ctx.textBaseline = 'bottom';

   					this.data.datasets.forEach(function (dataset, i) {
   						var meta = chartInstance.controller.getDatasetMeta(i);
   						meta.data.forEach(function (bar, index) {
   							var data = dataset.data[index];							
   							ctx.fillText(data, bar._model.x, bar._model.y-5);
   							
   						});
   					});
   				}
   			},
   			scales: {
   				yAxes: [{
   					ticks: {
   						beginAtZero: true,
   						stepSize : 500,
   						fontSize : 14,
   					}
   				}]
   			}
   		}
   	});
       
       </script> 
       
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="Admin/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="Admin/assets/demo/chart-area-demo.js"></script>
        <script src="Admin/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="Admin/assets/demo/datatables-demo.js"></script>
    </body>
</html>
