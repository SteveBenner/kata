var itsPlace;

itsPlace = $('.2-hydra').offsetParent();

$('.2-hydra').click(function() {
  var h, heads, i, j, len;
  heads = (function() {
    var j, results;
    results = [];
    for (i = j = 1; j <= 2; i = ++j) {
      results.push($(this).clone(true));
    }
    return results;
  }).call(this);
  $(this).remove();
  for (j = 0, len = heads.length; j < len; j++) {
    h = heads[j];
    h.appendTo(itsPlace);
  }
  return $('body > p').text("Button count: " + ($('.2-hydra').size()));
});
