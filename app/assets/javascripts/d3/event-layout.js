<<<<<<< HEAD
var test = d3.select("h1")
  .style("background-color", "blue")


var svg = d3.select('.tables').append("svg:g")
  .attr("width", 150)
  .attr("height", 150);

var originX = 75;
var originY = 75;
var tableRadius = 40;

var table = svg.append("svg:circle")
  .attr("cx", originX)
  .attr("cy", originY)
  .attr("r", tableRadius)
  .style("fill", "#595AB7");

// ({
//   cx: originX,
//   cy: originY,
//   r: tableRadius,
//   fill: "#595AB7"
// });
=======

var h = 400,
    w = 400;
var circleWidth = 5;

var palette = {

    "lightgray": "#819090",
    "gray": "#708284",
    "mediumgray": "#536870",
    "darkgray": "#475B62",

    "darkblue": "#0A2933",
    "darkerblue": "#042029",

    "paleryellow": "#FCF4DC",
    "paleyellow": "#EAE3CB",
    "yellow": "#A57706",
    "orange": "#BD3613",
    "red": "#D11C24",
    "pink": "#C61C6F",
    "purple": "#595AB7",
    "blue": "#2176C7",
    "green": "#259286",
    "yellowgreen": "#738A05"
}

var nodes = [
    { name: "Parent"},
    { name: "child1"},
    { name: "child2", target: [0]},
    { name: "child3", target: [0]},
    { name: "child4", target: [1]},
    { name: "child5", target: [0,1,2,3]},

    ];

var links = [];

for (var i = 0; var i< nodes.length; i++) {
    if(nodex[i].target !== undefined) {
        for (var x = 0; x < nodes[i].target; x++ ){
            links.push({
                source: nodes[i],
                target: nodes[i].target[x]
            })
        }
    }
};

var myChart = d3.select('#chart')
    .append('svg')
    .attr('width', w)
    .attr('height', h)

var force = d3.layout.force

var colors = d3.scale.linear()
.domain([0, bardata.length*.33, bardata.length*.66, bardata.length])
.range(['#B58929','#C61C6F', '#268BD2', '#85992C'])

var yScale = d3.scale.linear()
        .domain([0, d3.max(bardata)])
        .range([0, height]);

var xScale = d3.scale.ordinal()
        .domain(d3.range(0, bardata.length))
        .rangeBands([0, width])

var tooltip = d3.select('body').append('div')
        .style('position', 'absolute')
        .style('padding', '0 10px')
        .style('background', 'white')
        .style('opacity', 0)

var myChart = d3.select('#chart').append('svg')
    .attr('width', width)
    .attr('height', height)
    .selectAll('rect').data(bardata)
    .enter().append('rect')
        .style('fill', function(d,i) {
            return colors(i);
        })
        .attr('width', xScale.rangeBand())
        .attr('x', function(d,i) {
            return xScale(i);
        })
        .attr('height', 0)
        .attr('y', height)

    .on('mouseover', function(d) {

        tooltip.transition()
            .style('opacity', .9)

        tooltip.html(d)
            .style('left', (d3.event.pageX - 35) + 'px')
            .style('top',  (d3.event.pageY - 30) + 'px')


        tempColor = this.style.fill;
        d3.select(this)
            .transition()
            .style('opacity', .5)
            .style('fill', 'yellow')
    })

    .on('mouseout', function(d) {
        d3.select(this)
            .transition().duration(800)
            .style('opacity', 1)
            .style('fill', tempColor)
    })

myChart.transition()
    .attr('height', function(d) {
        return yScale(d);
    })
    .attr('y', function(d) {
        return height - yScale(d);
    })
    .delay(function(d, i) {
        return i * 20;
    })
    .duration(1000)
    .ease('elastic')

>>>>>>> 0aaaab6777be7f4a40993307c23a7098e69b1722
