
import h3d.Vector;

class PhysicsComponent extends ComponentInfo {
  public static function get () {
    return {
      id: 2,
      data: Physics,
      attach: function (p:Physics, e:Int) {
        p.vel.x = (1 + Math.random()) * 10;
        p.vel.y = (1 + Math.random()) * 10;
      },
      update: function (dt:Float, p:Physics, e:Int) {
        p.vel.y += 25 * dt;
        p.pos.x += p.vel.x;
        p.pos.y += p.vel.y;

        if (p.pos.x < 0 || p.pos.x > Theta.scene.width) p.vel.x *= -1;
        if (p.pos.y > Theta.scene.height) p.vel.y *= -1;

        var sprite:h2d.Bitmap = Theta.state(Sprite).get(e).sprite;
        sprite.x = p.pos.x;
        sprite.y = p.pos.y;
      }
    }
  }
}

class Physics {
  public var pos:Vector = new Vector();
  public var vel:Vector = new Vector();
}