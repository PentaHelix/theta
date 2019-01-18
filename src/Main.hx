class Main extends hxd.App {
  var p:Position;
  override public function init () {
    Theta.init();

    var time = Sys.time();

    for (i in 0...1000) {
      (new Entity()).add(Position);
      Theta.update(1/60);
    }

    // var e:Entity = (new Entity()).add(Position);
    // e.get(Position).x += 10;

    trace(Sys.time() - time);
  }

  static function main () {
    new Main();
  }
}