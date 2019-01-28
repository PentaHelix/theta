package theta.components;

import theta.Entity;
import haxe.Constraints.Function;

typedef ComponentAttach = Dynamic->Entity->Void;
typedef ComponentUpdate = Float->Dynamic->Entity->Void;

typedef ComponentDeclaration = {
  var id:Int;
  var data:Class<{}>;
  var ?attach:Function;
  var ?update:Function;
  var ?lateUpdate:Function;
}
