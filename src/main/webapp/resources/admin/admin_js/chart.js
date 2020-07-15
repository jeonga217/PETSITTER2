$(function(){
    

    var ctx2 = document.getElementById('myChart2');
    var myChart2 = new Chart(ctx2, {
        type: 'line',
        data: {
            labels: ['1월', '2월', '3월', '4월','5월', '6월','7월', '8월', '9월', '10월','11월', '12월'],
            datasets: [{
                label: '월 별',
                data: [50, 40, 70, 60, 50, 80,50, 40, 70, 60, 50, 80],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
        }
    });
})