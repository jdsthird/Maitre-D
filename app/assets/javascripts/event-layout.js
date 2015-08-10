// var test = d3.select("h1")
  // .style("background-color", "blue")

var numOfTables = <%= @num_of_tables %>
var seatsPerTable = <%= seats_per_table %>;
// console.log(seatsPerTable);
var rotationFactor = Math.floor(360 / seatsPerTable);

for (var tableCounter = 1; tableCounter <= numOfTables; tableCounter++) {
    var svg = d3.select('#table-' + tableCounter).append('svg')
      .attr("width", 150)
      .attr("height", 150);
    var group = svg.append('g');

    var originX = 75;
    var originY = 75;
    var tableRadius = 40;
    var chairsRadius = 55;
    var chairWidth = 15;

    var table = group.append("circle").attr({
      cx: originX,
      cy: originY,
      r: tableRadius,
      fill: "#595AB7"
    });

    var chairOriginX = originX + (chairsRadius * Math.sin(0));
    var chairOriginY = originY - (chairsRadius * Math.cos(0));

    group.append("rect").attr({
        x: chairOriginX - (chairWidth / 2),
        y: chairOriginY - (chairWidth / 2),
        width: chairWidth,
        opacity: 1,
        height: chairWidth,
        fill: "none",
        stroke: "#C61C6F"
    });

    // var seatCounter = 1;

    // group.append("text").attr({
    //     x: chairOriginX - (chairWidth / 2),
    //     y: chairOriginY - (chairWidth / 2),
    //     width: chairWidth * 2,
    //     opacity: 1,
    //     height: chairWidth * 2
    //     // fill: "none",
    //     // id: "table-" + tableCounter + "seat-" + seatCounter
    // }).text(function(tableCounter, seatCounter) {
    //     return "test";
    // });

    var rotation = 0;

    for (var i = 1; i < seatsPerTable; i++) {
        var currentChair = group.append("rect").attr({
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
}