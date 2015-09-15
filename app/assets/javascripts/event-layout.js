


var guestList = new Guests();
  guestList.fetch({success: function(){

  var data = guestList.eventTableIds().forEach(function(table_id, i){

    console.log(data);
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
    var drag = d3.behavior.drag()
    .on("drag", dragmove);

    function dragmove(d) {
      var x = d3.event.x;
      var y = d3.event.y;
      d3.select(this).attr("transform", "translate(" + x + "," + y + ")");
    }



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
      currentChair.call(drag);
    }
  });
  
     $('.chair').hover(
      function(){
        var span = $(this).parent().parent().parent().find("span");
        span.html($(this).attr("data"));
        span.css("color", "yellow");
        span.css("font-size", "1.2em");
        $(this).css("fill", "#C61C6F");
        // $(this).parent().parent().parent().find("span").html(
        //   $(this).attr("data")
        // );

      }, function() {
        $(this).parent().parent().parent().find("span").html("");
        $(this).css("fill", "black");
      });

}});

