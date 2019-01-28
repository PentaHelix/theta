package theta.components;

import haxe.Constraints.Function;
import theta.components.ComponentDeclaration;

class Component<T:{}> {
  //entities with this component
  public var entities:Array<Entity> = [];
  // component data
  public var data:Array<T> = [];

  // component hooks
  public var fAttach:Function;
  public var fUpdate:Function;
  public var fLateUpdate:Function;

  public function new (decl:ComponentDeclaration) {
    fAttach = decl.attach;
    fUpdate = decl.update;
    fLateUpdate = decl.lateUpdate;

    if (decl.attach != null) {
      fAttach = decl.attach;
      

    }
  }

  public function update (dt:Float) {
    if (fUpdate != null) {
      for (e in entities) {
        this.fUpdate(dt, data[e.id], e);
      }
    }

    if (fLateUpdate != null) {
      for (e in entities) {
        this.fLateUpdate(dt, data[e.id], e);
      }
    }
  }

  public function get (entity:Entity):T {
    return data[entity.id];
  }

  public function init (entity:Entity, with:T) {
    entities.push(entity);
    data[entity.id] = with;
    if (fAttach != null) fAttach(data[entity.id], entity);
  }
}