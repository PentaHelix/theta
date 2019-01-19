import ComponentDeclaration;

class Component<T:{}> {
  public var entities:Array<Int> = []
  public var data:Array<T> = [];
  public var fAttach:ComponentAttach;
  public var fUpdate:ComponentUpdate;

  public function new (decl:ComponentDeclaration) {
    this.fAttach = decl.attach;
    this.fUpdate = decl.update;
  }

  public function update (dt:Float) {
    if (fUpdate == null) return;
    for (i in entities) {
      this.fUpdate(dt, data[i], i);
    }
  }

  public function get (entity:Int):T {
    return data[entity];
  }

  public function init (entity:Int, with:T) {
    entities.push(entity);
    data[entity] = with;
    if (fAttach != null) fAttach(data[entity], entity);
  }
}