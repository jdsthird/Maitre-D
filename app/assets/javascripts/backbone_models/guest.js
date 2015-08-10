var Guest = Backbone.Model.extend({
  urlRoot: "/guests"
});

var Guests = Backbone.Collection.extend({
  url: "/guests",
  model: Guest
});
