class Component<T:{}> {
  public var data:Array<T> = [];
  public var fUpdate:Float->Dynamic->Void;

  public function new (fUpdate:Float->Dynamic->Void) {
    this.fUpdate = fUpdate;
  }

  public function update (dt:Float) {
    for (d in data) {
      this.fUpdate(dt, d);
    }
  }

  public function remove () {}

  public function get (entity:Int):T {
    return data[entity];
  }

  public function init (entity:Int, with:T) {
    data[entity] = with;
  }
}