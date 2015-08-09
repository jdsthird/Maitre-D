var seatsPerTable = <%= seats_per_table %>;
var rotationFactor = Math.floor(360 / seatsPerTable);

var svg = d3.selectAll('.tables').append('svg')
  .attr("width", 150)
  .attr("height", 150);
var originX = 75;
var originY = 75;
var tableRadius = 40;
var chairsRadius = 55;
var chairWidth = 15;

var table = svg.append("circle").attr({
  cx: originX,
  cy: originY,
  r: tableRadius,
  fill: "#595AB7"
});

var chairOriginX = originX + (chairsRadius * Math.sin(0));
var chairOriginY = originY - (chairsRadius * Math.cos(0));

svg.append("rect").attr({
    x: chairOriginX - (chairWidth / 2),
    y: chairOriginY - (chairWidth / 2),
    width: chairWidth,
    opacity: 1,
    height: chairWidth,
    fill: "none",
    stroke: "#C61C6F"
});

var rotation = 0;

for (i = 1; i < seatsPerTable; i++) {
    var currentChair = svg.append("rect").attr({
        x: chairOriginX - (chairWidth / 2),
        y: chairOriginY - (chairWidth / 2),
        width: chairWidth,
        opacity: 1,
        height: chairWidth,
        fill: "none",
        stroke: "#C61C6F"
    });

    rotation += rotationFactor;
    currentChair.attr("transform", "rotate(" + rotation + ", " + originX + ", " + originY + ")");
}