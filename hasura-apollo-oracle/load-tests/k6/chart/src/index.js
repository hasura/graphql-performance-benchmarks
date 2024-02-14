import json from './data.json'
import Chart from 'chart.js/auto';
//test

(async function() {

  const labelsLP = ["1"];
  const dataLP = {
    labels: labelsLP,
    datasets: [],
      options: {
          onClick: (e) => {
            const canvasPosition = getRelativePosition(e, chart);
      
            // Substitute the appropriate scale IDs
            const dataX = chart.scales.x.getValueForPixel(canvasPosition.x);
            const dataY = chart.scales.y.getValueForPixel(canvasPosition.y);
          },
      }
  };
  
  const data2LP = {
      labels: labelsLP,
      datasets: [],
        options: {
            onClick: (e) => {
              const canvasPosition = getRelativePosition(e, chart);
        
              // Substitute the appropriate scale IDs
              const dataX = chart.scales.x.getValueForPixel(canvasPosition.x);
              const dataY = chart.scales.y.getValueForPixel(canvasPosition.y);
            }
        }
    };
    
    const data3LP = {
      labels: labelsLP,
      datasets: [],
        options: {
            onClick: (e) => {
              const canvasPosition = getRelativePosition(e, chart);
        
              // Substitute the appropriate scale IDs
              const dataX = chart.scales.x.getValueForPixel(canvasPosition.x);
              const dataY = chart.scales.y.getValueForPixel(canvasPosition.y);
            }
        }
    };
  
const labels = ["10", "20", "40", "100", "200", "400", "1,000", "2,000", "4,000", "10,000"];
const data = {
  labels: labels,
  datasets: [],
    options: {
        onClick: (e) => {
          const canvasPosition = getRelativePosition(e, chart);
    
          // Substitute the appropriate scale IDs
          const dataX = chart.scales.x.getValueForPixel(canvasPosition.x);
          const dataY = chart.scales.y.getValueForPixel(canvasPosition.y);
        },
    }
};

const data2 = {
    labels: labels,
    datasets: [],
      options: {
          onClick: (e) => {
            const canvasPosition = getRelativePosition(e, chart);
      
            // Substitute the appropriate scale IDs
            const dataX = chart.scales.x.getValueForPixel(canvasPosition.x);
            const dataY = chart.scales.y.getValueForPixel(canvasPosition.y);
          }
      }
};
  
const data3 = {
    labels: labels,
    datasets: [],
      options: {
          onClick: (e) => {
            const canvasPosition = getRelativePosition(e, chart);
      
            // Substitute the appropriate scale IDs
            const dataX = chart.scales.x.getValueForPixel(canvasPosition.x);
            const dataY = chart.scales.y.getValueForPixel(canvasPosition.y);
          }
      }
};

for (const key in json){
    if(json.hasOwnProperty(key)){
        var rpsData = [];
        var httpTtfbAvgData = [];
        var errorData = [];
        var hCOL = json[key];

        for (var i=0; i < hCOL.length; i++) {
            rpsData.push(hCOL[i].rps);
            httpTtfbAvgData.push(hCOL[i].httpTtfbAvg);
            errorData.push(hCOL[i].errors);
        }

        data.datasets.push(
            {label: key, 
            data: rpsData,
            yAxisID: 'y',
        });

        data2.datasets.push(
            {label: key, 
            data: httpTtfbAvgData,
            yAxisID: 'y',
        });

        data3.datasets.push(
            {
                label: key,
                data: errorData,
                yAxisID: 'y',
            }
        )
    }
}

const config = {
    type: 'line',
    data: data,
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'bottom',
          align: 'start',
          labels: {
            boxWidth: 10,
          },
        },
        title: {
          display: true,
          text: 'RPS Comparison'
        }
      },
      scales: {
        y: {
          type: 'linear',
          display: true,
          position: 'left',
          title: {
            display: true,
            align: 'center',
            text: 'RPS',
          },
        },
        x: {
          type: 'category',
          display: true,
          title: {
            display: true,
            align: 'center',
            text: 'Concurrent Connections',
          },
        },
      }
},
};

const config2 = {
    type: 'line',
    data: data2,
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'bottom',
          align: 'start',
          labels: {
            boxWidth: 10,
          },
        },
        title: {
          display: true,
          text: 'Time to First Byte'
        }
      },
      scales: {
        y: {
            type: 'linear',
            display: true,
            position: 'left',
            title: {
              display: true,
              align: 'center',
              text: 'Milliseconds',
            },
          },
        x: {
          type: 'category',
          display: true,
          title: {
            display: true,
            align: 'center',
            text: 'Concurrent Connections',
          },
        },
      }
    },
};

const config3 = {
    type: 'line',
    data: data3,
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'bottom',
          align: 'start',
          labels: {
            boxWidth: 10,
          },
        },
        title: {
          display: true,
          text: 'Error Rate'
        }
      },
      scales: {
        y: {
            type: 'linear',
            display: true,
            position: 'left',
            title: {
              display: true,
              align: 'center',
              text: 'Error Rate',
            },
          },
        x: {
          type: 'category',
          display: true,
          title: {
            display: true,
            align: 'center',
            text: 'Concurrent Connections',
          },
        },
      }
    },
};

new Chart(
    document.getElementById('chartRPS'),
    config,
);
new Chart(
    document.getElementById('charthttpTtfbAvg'),
    config2,
);
new Chart(
    document.getElementById('errorRateDiv'),
    config3,
);


})();