package theta;

import theta.components.Debug as DebugComponent;

class Entity {
  private static var count:Int = 0;
  public var id:Int;
  public var name:String = 'Unnamed entity';
  public var hasComponents:Array<Class<Dynamic>> = [];

  public function new (?components:Array<Class<Dynamic>>) {
    id = count;
    count++;
    if (components == null) components = [];
    for (c in components) {
      add(c);
    }

    #if debug
      // add(DebugComponent);
    #end
  }

  public function add(c:Class<Dynamic>):Entity {
    hasComponents.push(c);
    Engine.state(c).init(this, Type.createInstance(c, [])); 
    
    return this;
  }

  public function get<T:{}>(c:Class<T>):T {
    return Engine.state(c).get(this);
  }
}