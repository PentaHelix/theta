class PositionComponent extends ComponentInfo {
  public static function get ():ComponentDeclaration {
    return {
      id: 0,
      data: Position,
      attach: function (d:Position, e:Int) {
        d.dx = Math.random();
        d.dy = Math.random();
      },
      update: function (dt:Float, p:Position, e:Int) {
        p.x += 10 * dt * p.dx;
        p.y += 10 * dt * p.dy;
        var sprite:h2d.Bitmap = Theta.state(Sprite).get(e).sprite;
        sprite.x = p.x;
        sprite.y = p.y;
      }
    }
  }
}

class Position {
  public var x:Float = 0;
  public var y:Float = 0;

  public var dx:Float = 0;
  public var dy:Float = 0;
}