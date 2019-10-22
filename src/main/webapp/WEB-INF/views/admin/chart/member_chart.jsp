<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- javascript -->
<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
</head>
<body>
	<div id="mem_c_address_chart" style="width: 900px; height: 500px;"></div>
</body>



<script type='text/javascript'>
google.charts.load('current', {
    'packages': ['geochart'],
    'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
  });
  google.charts.setOnLoadCallback(drawMarkersMap);
/* 
function drawMarkersMap() {
    var data = google.visualization.arrayToDataTable([
      ['City',   'Population', 'Area'],
      ['Rome',      2761477,    1285.31],
      ['Milan',     1324110,    181.76],
      ['Naples',    959574,     117.27],
      ['Turin',     907563,     130.17],
      ['Palermo',   655875,     158.9],
      ['Genoa',     607906,     243.60],
      ['Bologna',   380181,     140.7],
      ['Florence',  371282,     102.41],
      ['Fiumicino', 67370,      213.44],
      ['Anzio',     52192,      43.43],
      ['Ciampino',  38262,      11]
    ]);

    var options = {
      region: 'IT',
      displayMode: 'markers',
      colorAxis: {colors: ['green', 'blue']}
    };

    var chart = new google.visualization.GeoChart(document.getElementById('mem_c_address_chart'));
    chart.draw(data, options);
  };
 */

function drawMarkersMap() {
var data = google.visualization.arrayToDataTable([
  	['City',   'Population', 'Area'],
   	['Seoul',	2761477,	1285.31],
  	['Busan',	2761477,	1285.31],
  	['Daegu',	2761477,	1285.31],
  	['Daejeon',	2761477,	1285.31],
  	['Gwangju',	2761477,	1285.31],
  	['Incheon',	2761477,	1285.31],
  	['Ulsan',	2761477,	1285.31],
  	['Jeju',	2761477,	1285.31]
  ]);

  var options = {
	region: 'KR',
    displayMode: 'markers',
    colorAxis: {colors: ['green', 'blue']}
  };

  var chart = new google.visualization.GeoChart(document.getElementById('mem_c_address_chart'));
  chart.draw(data, options);
};

 
</script>
</html>