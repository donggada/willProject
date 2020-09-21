<%@page import="admin.vo.CarBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart.js</title>
<head>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<body>
	<canvas id="myChart" width="500" height="500"></canvas>
<%
ArrayList<CarBean> cb=(ArrayList<CarBean>)request.getAttribute("cb");
ArrayList carmaker=new ArrayList();
ArrayList carcount= new ArrayList();

for(int i = 0; i < cb.size(); i++){
	carmaker.add("'"+cb.get(i).getCar_maker()+"'");
	carcount.add(cb.get(i).getCar_id());
}

//System.out.print(carcount);
//System.out.print(carmaker);


%>

	<script>
	var carmaker=<%=carmaker%>
	var carcount=<%=carcount%>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
			labels: carmaker,
			datasets: [{
				label: '# of Votes',
				data: carcount,
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
			render: 'value',
			//pieceLabel: { mode:"value", position:"default", fontSize: 11, fontStyle: 'bold' },
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
					ctx.textBaseline = 'middle';

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
						stepSize : 100,
						fontSize : 14,
					}
				}]
			}
		}
	});
	</script>
</body>
</body>
</html>