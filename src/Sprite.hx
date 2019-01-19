import h2d.Bitmap;
import hxd.Res;
import h2d.Tile;

class SpriteComponent extends ComponentInfo {
  public static function get ():ComponentDeclaration {
    return {
      id: 1,
      data: Sprite,
    }
  }

  public static function load (s:Sprite, path:String, ?parent:h2d.Object) {
    var t:Tile = Res.load('bunny.png').toTile();
    s.sprite = new Bitmap(t,parent);
  }
}

class Sprite {
  public var sprite:h2d.Bitmap;
}