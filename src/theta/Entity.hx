package theta;

import theta.components.Transform2D;
import theta.util.BitField;
import theta.components.Component;
import hl.Ref;
import haxe.Constraints.Constructible;

class Entity {
  private static var count:Int = 0;
  public var id:Int;
  public var name:String = 'Unnamed entity';
  public var components:Array<Ref<Component>> = [];
  public var fingerprint:BitField = new BitField();

  public function new (?components:Array<Class<Component>>, ?addTransform:Bool=true) {
    id = count;
    count++;

    if (components == null) components = [];
    for (c in components) {
      add(c);
    }

    if (addTransform) {
      add(Transform2D);
    }
  }

  public function add<T:Component>(c:Class<T>):Entity {
    var component_id = Reflect.field(c, 'id');
    fingerprint.set(component_id, true);
    components[id] = new Ref<Component>(Engine.state(c).getNext());
    
    return this;
  }

  @:generic
  public function get<T:Component>(c:Class<T>):T {
    return cast components[Reflect.field(c, 'id')].get();
  }
}