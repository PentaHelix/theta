package theta;

import haxe.macro.Context;
import haxe.Constraints.Constructible;
import theta.components.Component;
import haxe.ds.Vector;

// @:genericBuild(theta.util.Macro.buildState())
class State<T:Component> {
  public var data:Vector<T>;
  private var next:Int = 0;
  private var instance:T;

  public function new (c:Component) {
    instance = cast c;
    data = new Vector(100);
    for (i in 0...data.length) {
      data[i] = Reflect.copy(instance);
    }
  }

  public function getNext ():T {
    if (next == data.length) resize();
    return data[next++];
  }

  private function resize () {
    var start = data.length;
    var v = new Vector(Std.int(data.length * 2.5));
    Vector.blit(data, 0, v, 0, start);
    data = v;
    for (i in start...data.length) {
      data[i] = Reflect.copy(instance);
    }
  }
}