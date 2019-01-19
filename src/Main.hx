import h2d.Text;
import hxd.Res;
import h2d.Tile;
using Sprite;

class Main extends hxd.App {
  var p:Position;
  var t:Tile;
  var fps:Text;

  override public function init () {
    Theta.init(s2d);
    fps = new Text(hxd.res.DefaultFont.get());

    s2d.addChildAt(fps, 10);
    t = Res.load('bunny.png').toTile();
  }


  var i:Int = 0;
  override public function update (dt:Float) {
    Theta.update(dt);
    fps.text = Std.int(1 / dt) + " fps (" + i + ")";
    for (x in 0...10) {
      createBunny();
      i++;
    }
  }

  function createBunny():Void {
    var e:Entity = new Entity([Physics, Sprite]);
    e.get(Sprite).setTile(t);
  }

  static function main () {
    hxd.Res.initEmbed();
    new Main();
  }
}