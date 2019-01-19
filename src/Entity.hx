
class Entity {
  private static var count:Int = 0;
  public var id:Int;
  public var hasComponents:Array<Class<Dynamic>> = [];

  public function new (?components:Array<Class<Dynamic>>) {
    id = count;
    count++;
    if (components == null) components = [];
    for (c in components) {
      add(c);
    }
  }

  public function add(c:Class<Dynamic>):Entity {
    hasComponents.push(c);
    Theta.state(c).init(this.id, Type.createInstance(c, []));
    return this;
  }

  public function get<T:{}>(c:Class<T>):T {
    return Theta.state(c).get(this.id);
  }
}