$(document).ready(function () {
	//alert("통계");
	
	//Create the chart
	Highcharts.chart('container', {
	  chart: {
	    type: 'column'
	  },
	  title: {
		  text: 'RHYMESb market 매출.'
	    /*text: 'RHYMESb market 매출.'*/
	  },
	  subtitle: {
	    text: /*'<%=year %>년 <%=month %>월'*/ '2019년 10월'
	  },
	  xAxis: {
	    type: 'category'
	  },
	  yAxis: {
	    title: {
	      text: '총 결제금액'
	    }

	  },
	  legend: {
	    enabled: false
	  },
	  plotOptions: {
	    series: {
	      borderWidth: 0,
	      dataLabels: {
	        enabled: true,
	        format: '{point:1d}원'
	      }
	    }
	  },

	  tooltip: {
	    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point:1d}</b>원<br/>'
	  },

	  series: [
	    {
	      name: "RHYEMESb",
	      colorByPoint: true,
	      data: [
	        {
	          name: "1월",
	          y: 62,
	          drilldown: "1월"
	        },
	        {
	          name: "2월",
	          y: 10,
	          drilldown: "2월"
	        },
	        {
	          name: "3월",
	          y: 7,
	          drilldown: "3월"
	        },
	        {
	          name: "4월",
	          y: 5,
	          drilldown: "4월"
	        },
	        {
	          name: "5월",
	          y: 4,
	          drilldown: "5월"
	        },
	        {
	          name: "6월",
	          y: 1,
	          drilldown: "6월"
	        },
	        {
	          name: "7월",
	          y: 7,
	          drilldown: "7월"
	        },
	        {
	          name: "8월",
	          y: 7,
	          drilldown: "8월"
	        },
	        {
	          name: "9월",
	          y: 7,
	          drilldown: "9월"
	        },
	        {
	          name: "10월",
	          y: 7,
	          drilldown: "10월"
	        },
	        {
	          name: "11월",
	          y: 7,
	          drilldown: "11월"
	        },
	        {
	          name: "12월",
	          y: 7,
	          drilldown: "12월"
	        }
	      ]
	    }
	  ],
	  drilldown: {
	    series: [
	      {
	        name: "Chrome",
	        id: "Chrome",
	        data: [
	          [
	            "v65.0",
	            0.1
	          ],
	          [
	            "v64.0",
	            1.3
	          ],
	          [
	            "v63.0",
	            53.02
	          ],
	          [
	            "v62.0",
	            1.4
	          ],
	          [
	            "v61.0",
	            0.88
	          ],
	          [
	            "v60.0",
	            0.56
	          ],
	          [
	            "v59.0",
	            0.45
	          ],
	          [
	            "v58.0",
	            0.49
	          ],
	          [
	            "v57.0",
	            0.32
	          ],
	          [
	            "v56.0",
	            0.29
	          ],
	          [
	            "v55.0",
	            0.79
	          ],
	          [
	            "v54.0",
	            0.18
	          ],
	          [
	            "v51.0",
	            0.13
	          ],
	          [
	            "v49.0",
	            2.16
	          ],
	          [
	            "v48.0",
	            0.13
	          ],
	          [
	            "v47.0",
	            0.11
	          ],
	          [
	            "v43.0",
	            0.17
	          ],
	          [
	            "v29.0",
	            0.26
	          ]
	        ]
	      },
	      {
	        name: "Firefox",
	        id: "Firefox",
	        data: [
	          [
	            "v58.0",
	            1.02
	          ],
	          [
	            "v57.0",
	            7.36
	          ],
	          [
	            "v56.0",
	            0.35
	          ],
	          [
	            "v55.0",
	            0.11
	          ],
	          [
	            "v54.0",
	            0.1
	          ],
	          [
	            "v52.0",
	            0.95
	          ],
	          [
	            "v51.0",
	            0.15
	          ],
	          [
	            "v50.0",
	            0.1
	          ],
	          [
	            "v48.0",
	            0.31
	          ],
	          [
	            "v47.0",
	            0.12
	          ]
	        ]
	      },
	      {
	        name: "Internet Explorer",
	        id: "Internet Explorer",
	        data: [
	          [
	            "v11.0",
	            6.2
	          ],
	          [
	            "v10.0",
	            0.29
	          ],
	          [
	            "v9.0",
	            0.27
	          ],
	          [
	            "v8.0",
	            0.47
	          ]
	        ]
	      },
	      {
	        name: "Safari",
	        id: "Safari",
	        data: [
	          [
	            "v11.0",
	            3.39
	          ],
	          [
	            "v10.1",
	            0.96
	          ],
	          [
	            "v10.0",
	            0.36
	          ],
	          [
	            "v9.1",
	            0.54
	          ],
	          [
	            "v9.0",
	            0.13
	          ],
	          [
	            "v5.1",
	            0.2
	          ]
	        ]
	      },
	      {
	        name: "Edge",
	        id: "Edge",
	        data: [
	          [
	            "v16",
	            2.6
	          ],
	          [
	            "v15",
	            0.92
	          ],
	          [
	            "v14",
	            0.4
	          ],
	          [
	            "v13",
	            0.1
	          ]
	        ]
	      },
	      {
	        name: "Opera",
	        id: "Opera",
	        data: [
	          [
	            "v50.0",
	            0.96
	          ],
	          [
	            "v49.0",
	            0.82
	          ],
	          [
	            "v12.1",
	            0.14
	          ]
	        ]
	      }
	    ]
	  }
	});
});