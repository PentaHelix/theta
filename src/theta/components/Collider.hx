package theta.components;


import h2d.col.IBounds;
@:allow(theta.components.ColliderComponent)
class Collider extends Component {
  public var dx:Int;
  public var dy:Int;
  public var width:Int;
  public var height:Int;
  private var collider:IBounds;
}

// class ColliderComponent extends ComponentInfo {
//   // keep cached array of all colliders to speed up component lookup
//   public static var colliders:Array<Collider> = [];

//   // to prevent double checking colissions each frame
//   public static var checkAgainst:Array<Int> = [];

//   public static function get () : ComponentDeclaration {
//     return {
//       id: 3,
//       data: Collider,
//       update: function (dt:Float, c:Collider, e:Entity) {
//         var s = Engine.state(Sprite).get(e).sprite;
//         c.collider.x = Std.int(s.x) + c.dx;
//         c.collider.y = Std.int(s.y) + c.dy;
//       },

//       lateUpdate: function (dt:Float, c:Collider, e:Entity) {
//         for (col in colliders) {
//           if (c.collider.intersects(col.collider)) {
//             trace('colision')
//           }
//         }
//       },

//       attach: function (c:Collider, e:Entity) {
//         ColliderComponent.colliders.push(c);
//       }
//     }
//   }

//   public static function setCollider (c:Collider, x:Int, y:Int, w:Int, h:Int) {
//     c.dx = y;
//     c.dy = x;
//     c.width = w;
//     c.height = h;

//     c.collider = new IBounds();
//   }
// }