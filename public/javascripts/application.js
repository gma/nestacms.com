(function() {
  var LuckyDip;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  LuckyDip = (function() {
    function LuckyDip(items) {
      this.change = __bind(this.change, this);
      this.nextItem = __bind(this.nextItem, this);      items.hide();
      this.items = items.toArray();
      if (this.items.length < 2) {
        throw "Instantiate LuckyDip with a set of 2 or more elements";
      }
      this.current = null;
    }
    LuckyDip.prototype.nextItem = function() {
      var index;
      index = Math.floor(Math.random() * this.items.length);
      if (this.current && index === $(this.items).index(this.current.get(0))) {
        return this.nextItem();
      } else {
        return $(this.items[index]);
      }
    };
    LuckyDip.prototype.change = function() {
      var show_next;
      show_next = __bind(function() {
        return this.current = this.nextItem().fadeIn('slow', __bind(function() {
          return setTimeout(this.change, 8000);
        }, this));
      }, this);
      if (this.current) {
        return this.current.fadeOut('slow', function() {
          return show_next();
        });
      } else {
        return show_next();
      }
    };
    return LuckyDip;
  })();
  $(function() {
    var lucky_dip;
    lucky_dip = new LuckyDip($('section.users li'));
    return lucky_dip.change();
  });
}).call(this);
