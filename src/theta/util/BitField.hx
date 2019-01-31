package theta.util;
using Lambda;


abstract BitField(Array<Int>) to Array<Int> from Array<Int>{
  public function new (?arr:Array<Int>) {
    if (arr != null) {
      this = arr;
    } else {
      this = [for(_ in 0...Math.ceil(Macro.COMPONENT_COUNT/32)) 0];
    }
  }

  public function set(i:Int, v:Bool) {
    if (v) this[Std.int(i/32)] |= 1 << (i%32);
    else this[Std.int(i/32)] &= 1 << (i%32);
  }

  @:op(A & B)
  function and (rhs:BitField) {
    return new BitField([for (i in 0...this.length) this[i] & rhs[i]]);
  }

  @:op(A | B)
  function or (rhs:BitField) {
    return new BitField([for (i in 0...this.length) this[i] | rhs[i]]);
  }

  @:op(A ^ B)
  function xor (rhs:BitField) {
    return new BitField([for (i in 0...this.length) this[i] ^ rhs[i]]);
  }

  @:op(A == B)
  function equals (rhs:BitField) {
    (this ^ rhs) == 0;
  }

  @:op(A == B)
  function equalsInt (rhs:Int) {
    if (rhs == 0) return this.exists(i -> i != 0);
    else return this[0] == rhs;
  }

  @:to
  function toInt ():Int {
    return this[0];
  }
}