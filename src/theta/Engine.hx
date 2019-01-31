package theta;

import h2d.Scene;
import haxe.Resource;
import theta.components.Component;
import theta.util.Debug;
import theta.util.Profiler;
import theta.System.SystemBase;

class Engine {
  public static var scene:Scene;
  public static var entities:Array<Int> = [];
  public static var systems:Array<SystemBase> = [];
  public static var states:Array<Dynamic> = [];

  public static function init (s:Scene) {
    scene = s;
    Profiler.init();
    Debug.init();

    var componentNames = Resource.getString('components').split(',').slice(1);

    for (n in componentNames) {
      var c = Type.resolveClass(n);
      states[Reflect.field(c, 'id')] = new State(Type.createInstance(c, []));
    }

    var systemNames = Resource.getString('systems').split(',').slice(1);
    trace(systemNames);
    for (n in systemNames) {
      var c = Type.resolveClass(n);
      var sys:SystemBase = cast Type.createInstance(c, []);
      sys.start();
      systems[Reflect.field(c, 'id')] = sys;
    }
  }

  public static function update (dt:Float) {
    Profiler.endFrame(dt);

    for (s in systems) {
      // Profiler.start(n + ' (Component)');
      s.update();
      // Profiler.end(n + ' (Component)');
    }
  }

  @:generic
  public static function state<T:Component>(c:Class<T>):State<T> {
    return states[Reflect.field(c, 'id')];
  }
}