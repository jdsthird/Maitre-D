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