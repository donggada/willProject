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
<div style="width:150%;">
<canvas id="canvas" height="550" width="550"></canvas>
<canvas id="myChart1" height="300" width="500"></canvas>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script>
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
var carmaker=<%=carmaker%>
var carcount=<%=carcount%>
var aaa=["assa","sad"]
var chartData=[1,2]
new Chart(document.getElementById("canvas"), {
    type: 'bar',
    data: {
        labels: aaa,
        datasets: [{
            label:'현재보유자동차 갯수',
            data: [1,2],
            borderColor: ["rgba(255, 201, 14, 1)", 'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'],
            backgroundColor: //"rgba(255, 201, 14, 0.5) 
				 ['rgba(255, 201, 14, 0.5)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            fill: false,
        }]
    },
    options: {
    	//legend: true,
    	//pieceLabel: { mode:'label', position:'outside', fontSize: 11, fontStyle: 'bold' },   
    	 scaleShowLabelBackdrop : true,
  		responsive: false,
        title: {
            display: true,
            text: '막대 차트 테스트'          
        },
        tooltips: {
            mode: 'index',
            intersect: true,
            callbacks: {
                title: function(tooltipItems, data) {
                    return data.labels[tooltipItems[0].datasetIndex[data]];//tooltipItems[0]
                }
            }
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'x축'
                },
                ticks: {
                    autoSkip: false
                }
            }],
            yAxes: [{
                display: true,
                ticks: {
                    suggestedMin: 0,
                },
                scaleLabel: {
                    display: true,
                    labelString: 'y축'
                }
            }]
        }
    }
  
});

</script>


</body>
</html>