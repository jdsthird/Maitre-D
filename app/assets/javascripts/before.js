
for (var tableCounter = 1; tableCounter <= numOfTables; tableCounter++) {
    var group = d3.select('#table-' + tableCounter).append('g')
      // .attr("width", 250)
      // .attr("height", 150);

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

    // group.append("rect").attr({
    //     x: chairOriginX - (chairWidth / 2),
    //     y: chairOriginY - (chairWidth / 2),
    //     width: chairWidth,
    //     opacity: 1,
    //     height: chairWidth,
    //     fill: "black",
    //     stroke: "#C61C6F"
    // });


    // var seatCounter = 1;
    // $(document).ready(function(){
    //     var guestlist = new Guests();
    //     guestlist.fetch();
    //     console.log(guestlist.toJSON());
    //   console.log("book");
    //   //console.log(allGuestlist);
    // });
        // tableFourGuestlist[0]
        // function(d, i)
        // give me a guest by index
    // selector
    // group.append("text").attr({
    //     x: chairOriginX - (chairWidth / 2),
    //     y: chairOriginY - (chairWidth / 2),
    //     width: chairWidth * 2,
    //     opacity: 2,
    //     height: chairWidth * 2
    //     // fill: "none",
    //     // id: "table-" + tableCounter + "seat-" + seatCounter
    // }).text(function(tableCounter, seatCounter) {
    //     return "q";
    // });
    //create a function to access model and display attributes on each chair
    var rotation = 0;

    for (var i = 0; i < seatsPerTable; i++) {
        var currentChair = group.append("rect").attr({
            x: chairOriginX - (chairWidth / 2),
            y: chairOriginY - (chairWidth / 2),
            width: chairWidth,
            opacity: 1,
            height: chairWidth,
            fill: "black",
            stroke: "#C61C6F"
        }
        .on('mouseover', function(){
          d3.select(this)
            .style('opacity', .5)
            .style('fill', "green")
          })
        );
        // .selectAll('rect').data(guestlist)
        //go through forEach d, i
        rotation += rotationFactor;
        currentChair.attr("transform", "rotate(" + rotation + ", " + originX + ", " + originY + ")");
    }
}
