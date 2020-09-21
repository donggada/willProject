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
<canvas id="pieChart" width=100 height=100></canvas>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
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

<script type="text/javascript">
var carmaker=<%=carmaker%>
var carcount=<%=carcount%>

var data = {
	    datasets: [{
	        data: carcount,
	        backgroundColor: [
	        	'rgba(255, 99, 132, 1)',
				'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)',
				'rgba(75, 192, 192, 1)',
				'rgba(153, 102, 255, 1)',
				'rgba(255, 159, 64, 1)'
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: carmaker
	};

	var pieOptions = {
			responsive: false,	
	  events: false,
	  animation: {
	    duration: 500,
	    easing: "easeOutQuart",
	    onComplete: function () {
	      var ctx = this.chart.ctx;
	      ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontFamily, 'normal', Chart.defaults.global.defaultFontFamily);
	      ctx.textAlign = 'center';
	      ctx.textBaseline = 'bottom';

	      this.data.datasets.forEach(function (dataset) {

	        for (var i = 0; i < dataset.data.length; i++) {
	          var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
	              total = dataset._meta[Object.keys(dataset._meta)[0]].total,
	              mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius)/2,
	              start_angle = model.startAngle,
	              end_angle = model.endAngle,
	              mid_angle = start_angle + (end_angle - start_angle)/2;

	          var x = mid_radius * Math.cos(mid_angle);
	          var y = mid_radius * Math.sin(mid_angle);

	          ctx.fillStyle = '#fff';
	          if (i == 3){ // Darker text color for lighter background
	            ctx.fillStyle = '#444';
	          }
	          var percent = String(Math.round(dataset.data[i]/total*100)) + "%";  
	         var count=String(dataset.data[i])+"대";
	          //Don't Display If Legend is hide or value is 0
	          if(dataset.data[i] != 0 && dataset._meta[0].data[i].hidden != true) {
	        	ctx.fillText(carmaker[i], model.x + x, model.y + y-15);
	            ctx.fillText(count, model.x + x, model.y + y);
	            // Display percent in another line, line break doesn't work for fillText
	            ctx.fillText(percent, model.x + x, model.y + y + 15);
	          }
	        }
	      });               
	    }
	  }
	};

	var pieChartCanvas = document.getElementById('pieChart');
	var pieChart = new Chart(pieChartCanvas, {
	  type: 'doughnut', // or doughnut
	  data: data,
	  options: pieOptions
	});

</script>
</body>
</html>