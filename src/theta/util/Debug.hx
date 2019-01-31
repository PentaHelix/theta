package theta.util;

import hxd.res.DefaultFont;
import h2d.Console;

class Debug {
  private static var console:Console;

  private static var inspectWindow:h2d.Object;

  public static function init () {
    console = new Console(DefaultFont.get());
    inspectWindow = new h2d.Object();
    inspectWindow.x = inspectWindow.y = 0;
    
    addCommands();
    
    Engine.scene.addChildAt(console, 10);
    Engine.scene.addChildAt(inspectWindow, 10);
  }

  private static function addCommands () {
    // console.addCommand("spawn", "Spawns an Entity", [{
    //   name: 'x',
    //   t: ConsoleArg.AInt,
    // }, {
    //   name: 'y',
    //   t: ConsoleArg.AInt,
    // }], function(args) {
			
		// });
  }

  public static function inspect (e:Entity) {
    // for (c in e.hasComponents) {
    //   makeComponentWindow(e, c);  
    // }
  }

  public static function makeComponentWindow(e:Entity, c:Class<Dynamic>) {
    trace('Entity inspection not implemented yet');
    // trace(c);
    // trace(Type.getInstanceFields(c));
  }
}