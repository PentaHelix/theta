package theta.components;

import h2d.Bitmap;
import hxd.Res;
import h2d.Tile;
import theta.Engine;


@:allow(theta.components.SpriteComponent)
class Sprite extends Component {
  public var sprite:h2d.Object;
  private var bitmap:h2d.Bitmap;
}

class SpriteComponent extends ComponentInfo {
  public static function get ():ComponentDeclaration {
    return {
      id: 1,
      data: Sprite,
      attach: function (s:Sprite, e:Entity) {
        s.sprite = new h2d.Object(Engine.scene);
      }
    }
  }

  public static function load (s:Sprite, path:String) {
    var t:Tile = Res.load('bunny.png').toTile();
    s.bitmap = new Bitmap(t,s.sprite);
  }

  public static function setTile (s:Sprite, t:Tile) {
    s.bitmap = new Bitmap(t, s.sprite);
  }

  public static function removeChild(s:Sprite, name:String) {
    s.sprite.getObjectByName(name).remove();
  }
}