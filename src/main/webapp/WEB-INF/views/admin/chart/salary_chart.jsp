<%@page import="com.rhymes.app.admin.chart.util.AdminChartJSON"%>
<%@page import="com.rhymes.app.admin.chart.model.AdminChartDTO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<AdminChartDTO> monthPriceJson = (List<AdminChartDTO>)request.getAttribute("monthPriceJson");
request.setAttribute("monthPriceJson", monthPriceJson);
List<AdminChartDTO> monthNumJson = (List<AdminChartDTO>)request.getAttribute("monthNumJson");
request.setAttribute("monthNumJson", monthNumJson);
List<AdminChartDTO> dayJson = (List<AdminChartDTO>)request.getAttribute("dayJson");
request.setAttribute("dayJson", dayJson);



AdminChartJSON json = new AdminChartJSON();
String monthPriceStr = json.jsonchangmonthPrice(monthPriceJson);
String monthNumStr = json.jsonchangmonthNum(monthNumJson);
String dayStr = json.jsonchangday(dayJson);



System.out.println("monthPriceStr : " + monthPriceStr);
System.out.println("monthNumStr : " + monthNumStr);
System.out.println("dayStr : " + dayStr);



request.setAttribute("monthPriceStr", monthPriceStr);
request.setAttribute("monthNumStr", monthNumStr);
request.setAttribute("dayStr", dayStr);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#containerDay, #sliders {
  min-width: 310px; 
  max-width: 800px;
  margin: 0 auto;
}
#containerDay {
  height: 400px; 
}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- java script -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/cylinder.js"></script>

<body>

	<!-- <div id="containerYear" style="min-width: 310px; max-width: 1300px; height: 400px; margin: 0 auto"></div> -->

	<div id="containerMonth" style="min-width: 310px; max-width: 1300px; height: 400px; margin: 0 auto"></div>

	<div id="containerDay" style="min-width: 310px; max-width: 1300px; height: 400px; margin-top: 30px"></div>
	
<script type="text/javascript">
//Create the chart
Highcharts.chart('containerMonth', {
    chart: {
        zoomType: 'xy'
    },
    title: {
        text: 'RHYMESb 매출'
    },
    subtitle: {
        text: '2019 년도'
    },
    xAxis: [{
        categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        crosshair: true
    }],
    yAxis: [{ // Primary yAxis
        labels: {
            format: '{value}개',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        },
        title: {
            text: '총 상품 판매 개수',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        }
    }, { // Secondary yAxis
        title: {
            text: '총 매출',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        labels: {
            format: '{value}원',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        opposite: true
    }],
    tooltip: {
        shared: true
    },
    legend: {
        layout: 'vertical',
        align: 'left',
        x: 120,
        verticalAlign: 'top',
        y: 100,
        floating: true,
        backgroundColor:
            Highcharts.defaultOptions.legend.backgroundColor || // theme
            'rgba(255,255,255,0.25)'
    },
    series: [{
        name: '총 매출',
        type: 'column',
        yAxis: 1,
        data: [ <%=request.getAttribute("monthPriceStr") %> ],
        tooltip: {
            valueSuffix: '원'
        }

    }, {
        name: '총 상품 판매 개수',
        type: 'spline',
        data: [ <%=request.getAttribute("monthNumStr")%> ],
        tooltip: {
            valueSuffix: '개'
        }
    }]
});



var chart = Highcharts.chart('containerDay', {

    title: {
        text: 'Chart.update'
    },

    subtitle: {
        text: 'Plain'
    },

    xAxis: {
        categories: []
    },

    series: [{
        type: 'column',
        colorByPoint: true,
        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
        showInLegend: false
    }]

});
</script>

</body>
</html>


