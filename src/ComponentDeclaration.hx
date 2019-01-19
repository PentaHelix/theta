typedef ComponentAttach = Dynamic->Int->Void;
typedef ComponentUpdate = Float->Dynamic->Int->Void;

typedef ComponentDeclaration = {
  var id:Int;
  var data:Class<{}>;
  var ?attach:ComponentAttach;
  var ?update:ComponentUpdate;
}
