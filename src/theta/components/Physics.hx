package theta.components;


import h3d.Vector;

class Physics {
  public var pos:Vector = new Vector();
  public var vel:Vector = new Vector();
}

class PhysicsComponent extends ComponentInfo {
  public static function get ():ComponentDeclaration {
    return {
      id: 2,
      data: Physics,
      attach: function (p:Physics, e:Entity) {
        p.vel.x = (1 + Math.random()) * 10;
        p.vel.y = (1 + Math.random()) * 10;
      },
      update: function (dt:Float, p:Physics, e:Entity) {
        p.vel.y += 25 * dt;
        p.pos.x += p.vel.x;
        p.pos.y += p.vel.y;

        if (p.pos.x < 0 || p.pos.x > Engine.scene.width) p.vel.x *= -1;
        if (p.pos.y > Engine.scene.height) p.vel.y *= -1;

        var sprite = Engine.state(Sprite).get(e).sprite;
        sprite.x = p.pos.x;
        sprite.y = p.pos.y;
      }
    }
  }
}