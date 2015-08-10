var Guest = Backbone.Model.extend({
  urlRoot: "/guests",
  fullName: function() {return this.get("first_name") + " " + this.get("last_name")}
});

var Guests = Backbone.Collection.extend({
  url: "/guests",
  model: Guest
});
