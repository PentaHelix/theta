import haxe.Resource;

class Theta {
  public static var entities:Array<Int> = [];
  public static var components:haxe.DynamicAccess<Dynamic> = {};
  public static var componentNames:Array<String> = [];

  public static function init () {
    var components:Array<String> = Resource.getString('components').split(',').slice(0,-1);
    var i = 0;    
    for(c in components) {
      var t:Class<Dynamic> = Type.resolveClass(c);
      var decl:ComponentDeclaration = Reflect.callMethod(t, Reflect.field(t, 'get'), []);
      initComponent(decl.data, decl.update);
      componentNames.push(Type.getClassName(decl.data));
      i++;
    }
  }

  public static function update (dt:Float) {
    for (n in componentNames) {
      components[n].update(dt);
    }
  }

  @:generic
  public static function state<T:{}>(t:Class<T>):Component<T> {
    return components.get(Type.getClassName(t));
  }

  @:generic
  public static function initComponent<T:{}>(t:Class<T>, update:Float->Dynamic->Void):Void {
    components.set(Type.getClassName(t), new Component<T>(update));
  }
}