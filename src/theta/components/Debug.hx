package theta.components;

import h2d.Interactive;

class Debug extends Component{
  public var interactive:Interactive;
}

// class DebugComponent extends ComponentInfo {
//   public static function get():ComponentDeclaration {
//     return {
//       id: 3,
//       data: Debug,
//       attach: function (d:Debug, e:Entity) {
//         var i:Interactive = new Interactive(50, 50, Engine.state(Sprite).get(e).sprite);
//         i.name = 'DebugInteractive';

//         i.backgroundColor = 0x888888;
//         i.x = 0;
//         i.y = 0;
      
//         i.onClick = function (ev) {
//           theta.util.Debug.inspect(e);
//         }
//         d.interactive = i;
//       },
//     }
//   }
// }