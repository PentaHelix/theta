class PositionComponent extends ComponentInfo {
  public static function get ():ComponentDeclaration {
    return {
      id: 0,
      data: Position,
      update: function (dt:Float, d:Position) {
        d.x += 10 * dt;
      }
    }
  }
}

class Position {
  public var x:Float = 0;
  public var y:Float = 0;
  public var z:Float = 0;
}