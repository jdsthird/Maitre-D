


var guestList = new Guests();
guestList.fetch({success: function(){

  guestList.eventTableIds().forEach(function(table_id, i){

    var group = d3.select('#table-' + (i+1) ).append('g')

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
      fill: "#520029"
    });

    var tableOne = guestList.tableSelector(table_id);
    var rotationFactor = Math.floor(360 / tableOne.length);

    for(var ii =0; ii < tableOne.length; ii++){
      var currentChair = group.append("rect").attr({
        x: chairOriginX - (chairWidth / 2),
        y: chairOriginY - (chairWidth / 2),
        width: chairWidth,
        opacity: 1,
        height: chairWidth,
        fill: "black",
        stroke: "#C61C6F",
        data: tableOne[ii].fullName(),
        class: 'chair',
        id: tableOne[ii].id
        
      });
      currentChair.attr("transform", "rotate(" + (ii*rotationFactor) + ", " + originX + ", " + originY + ")");
    }
  });
  
     $('.chair').hover(
      function(){
        $(this).parent().parent().parent().find("span").html(
          $(this).attr("data")
        );

      }, function() {
        $(this).parent().parent().parent().find("span").html("");
      });

}});

