var Guest = Backbone.Model.extend({
  urlRoot: "/guests",
  fullName: function() {return this.get("first_name") + " " + this.get("last_name")}
});

var Guests = Backbone.Collection.extend({
  url: "/guests",
  model: Guest,
  tableSelector: function(tableNumber){
    return this.models.filter(function(model){
      return (tableNumber === model.get("table_id"));
    })
  },
  findFarthestTable: function(){
    var ids = this.models.map(function(guest){ return guest.get("table_id") });
    return Math.max.apply(Math, ids);
  }
});
