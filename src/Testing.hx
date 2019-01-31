
import hl.Gc;
import haxe.ds.Vector;
import hl.NativeArray;
import theta.Engine;
import theta.Entity;
import h2d.Text;
import hxd.Res;
import h2d.Tile;
import theta.State;
import theta.components.Sprite;

// import theta.components.Physics;

using theta.components.Sprite;

class Testing extends hxd.App {
  var t:Tile;

  override public function init () {
    Engine.init(s2d);
    t = Res.load('bunny.png').toTile();
    t.scaleToSize(75, 96);
    // createBunny();
  }


  var i:Int = 0;
  override public function update (dt:Float) {
    // for (x in 0...10) {
    //   createBunny();
    // }
    // Engine.update(dt);
  }

  function createBunny():Void {
    var e:Entity = new Entity([Sprite]);
    // e.get(Sprite).setTile(t);
    // e.get(Sprite).sprite.x = 50;
    // e.get(Sprite).sprite.y = 600;
  }

  static function main () {
    hxd.Res.initEmbed();
    new Testing();
  }
}