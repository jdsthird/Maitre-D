// var test = d3.select("h1")
  // .style("background-color", "blue")

var rotationFactor = Math.floor(360 / seatsPerTable);
var guestList = new Guests();
guestList.fetch({success: function(){
  // var allGuestlist = guestList.map(function(guest){return guest.fullName()});
  // here we will eventually want to split on table
  for(var i =0; i < guestList.findFarthestTable(); i++){
    console.log(guestList.findFarthestTable());
    var group = d3.select('#table-' + (i+1) ).append('g')
    console.log(i)
    var originX = 75;
    var originY = 75;
    var tableRadius = 40;
    var chairsRadius = 55;
    var chairWidth = 15;

    var chairOriginX = originX + (chairsRadius * Math.sin(0));
    var chairOriginY = originY - (chairsRadius * Math.cos(0));

    var table = group.append("circle").attr({
      cx: originX,
      cy: originY,
      r: tableRadius,
      fill: "#595AB7"
    });

    var tableOne = guestList.tableSelector(i+1);
    // var tableGuests = tableOne.map(function(guest){ return guest.fullName() });
    for(var ii =0; ii < tableOne.length; ii++){
      var currentChair = group.append("rect").attr({
        x: chairOriginX - (chairWidth / 2),
        y: chairOriginY - (chairWidth / 2),
        width: chairWidth,
        opacity: 1,
        height: chairWidth,
        fill: "black",
        stroke: "#C61C6F",
        data: tableOne[ii].fullName()
      });
      currentChair.attr("transform", "rotate(" + (ii*rotationFactor) + ", " + originX + ", " + originY + ")");
    }
  }
}});

