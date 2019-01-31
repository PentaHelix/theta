package theta;

import h2d.Scene;
import haxe.Resource;
import theta.components.Component;
import theta.util.Debug;
import theta.util.Profiler;

class Engine {
  public static var scene:Scene;
  public static var entities:Array<Int> = [];
  public static var systems:Array<Dynamic> = [];
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
  }

  public static function update (dt:Float) {
    Profiler.endFrame(dt);

    // for (n in componentNames) {
    //   Profiler.start(n + ' (Component)');
    //   components[n].update(dt);
    //   Profiler.end(n + ' (Component)');
    // }
  }

  @:generic
  public static function state<T:Component>(c:Class<T>):State<T> {
    return states[Reflect.field(c, 'id')];
  }
}