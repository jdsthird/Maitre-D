var Table = Backbone.Model.extend({
  urlRoot: "/tables"
});

var Tables = Backbone.Collection.extend({
  url: "/tables",
  model: Table
});
