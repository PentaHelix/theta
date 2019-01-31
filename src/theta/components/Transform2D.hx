package theta.components;


import h3d.Vector;

import theta.components.Sprite;

class Transform2D extends Component {
  public var pos:Vector = new Vector();
  public var scale:Vector = new Vector();
  public var rotation:Float = 0;
}

class Physics extends Component {
  public var velocity:Vector = new Vector();
  public var mass:Float = 1;
  public var elasticity:Float = 1;
}

class PhysicsSystem extends System<Transform2D, Physics> {
  override public function start(t:Transform2D, p:Physics) {
    // entities[0].
  }
  
  override public function update(t:Transform2D, p:Physics) {
    trace('test');
  }
}

class TestSystem extends System<Sprite, Physics> {
  override public function update (s:Sprite, p:Physics) {
  }
}

// class PhysicsComponent extends ComponentInfo {
//   public static function get ():ComponentDeclaration {
//     return {
//       id: 2,
//       data: Physics,
//       attach: function (p:Physics, e:Entity) {
//         p.vel.x = (1 + Math.random()) * 10;
//         p.vel.y = (1 + Math.random()) * 10;
//       },
//       update: function (dt:Float, p:Physics, e:Entity) {
//         p.vel.y += 25 * dt;
//         p.pos.x += p.vel.x;
//         p.pos.y += p.vel.y;

//         if (p.pos.x < 0 || p.pos.x > Engine.scene.width) p.vel.x *= -1;
//         if (p.pos.y > Engine.scene.height) p.vel.y *= -1;

//         var sprite = Engine.state(Sprite).get(e).sprite;
//         sprite.x = p.pos.x;
//         sprite.y = p.pos.y;
//       }
//     }
//   }
// }