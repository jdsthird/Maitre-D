var Pairing = Backbone.Model.extend({
  urlRoot: "/pairings"
});

var Pairings = Backbone.Collection.extend({
  url: "/pairings",
  model: Pairing
});
