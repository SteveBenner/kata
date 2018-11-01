# Using the mythical Hydra as an example, create a button that is destroyed by clicking it, but two new buttons are created in it's place.

itsPlace = $('.2-hydra').offsetParent()
$('.2-hydra').click () ->
    heads = ($(@).clone(true) for i in [1..2])
    $(@).remove()
    h.appendTo(itsPlace) for h in heads
    $('body > p').text "Button count: #{$('.2-hydra').size()}"