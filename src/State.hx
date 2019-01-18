// import haxe.Constraints;

class State {}
// class State<T:Component> {
//   private var data:Array<T>;
  
//   public function new () {
//     data = [];
//   }

//   @:arrayAccess
//   public inline function get(entity:Int):T {
//     return data[entity];
//   }

//   public function init (entity:Int, with:T) {
//     data[entity] = with;
//   }

//   public function update (dt:Float) {
//     for (d in data) d.update(dt);
//   }
// }