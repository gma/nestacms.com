class LuckyDip
  constructor: (items) ->
    items.hide()
    @items = items.toArray()
    if @items.length < 2
      throw "Instantiate LuckyDip with a set of 2 or more elements"
    @current = null

  nextItem: =>
    index = Math.floor(Math.random() * @items.length)
    if @current and index == $(@items).index(@current.get(0))
      @nextItem()
    else
      $(@items[index])

  change: =>
    show_next = =>
      @current = @nextItem().fadeIn 'slow', => setTimeout @change, 8000
    if @current
      @current.fadeOut 'slow', -> show_next()
    else
      show_next()

$ ->
  lucky_dip = new LuckyDip($('section.users li'))
  lucky_dip.change()
