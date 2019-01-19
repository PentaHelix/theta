using Sprite;

class Main extends hxd.App {
  var p:Position;
  override public function init () {
    Theta.init();

    for (i in 0...10) {
      createBunny();
    }
  }

  override public function update (dt:Float) {
    Theta.update(dt);
  }

  function createBunny():Void {
    var e:Entity = new Entity([Position, Sprite]);
    e.get(Sprite).load('bunny.png', s2d);
  }

  static function main () {
    hxd.Res.initEmbed();
    new Main();
  }
}