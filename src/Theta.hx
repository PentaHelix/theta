import h2d.Scene;
import haxe.Resource;

class Theta {
  public static var scene:Scene;
  public static var entities:Array<Int> = [];
  public static var components:haxe.DynamicAccess<Dynamic> = {};
  public static var componentNames:Array<String> = [];

  public static function init (s:Scene) {
    Profiler.init(s);
    
    scene = s;
    var components:Array<String> = Resource.getString('components').split(',').slice(0,-1);
    var i = 0;    
    for(c in components) {
      var t:Class<Dynamic> = Type.resolveClass(c);
      var decl:ComponentDeclaration = Reflect.callMethod(t, Reflect.field(t, 'get'), []);
      initComponent(decl.data, decl);
      componentNames.push(Type.getClassName(decl.data));
      i++;
    }
  }

  public static function update (dt:Float) {
    Profiler.endFrame(dt);

    for (n in componentNames) {
      Profiler.start(n + ' (Component)');
      components[n].update(dt);
      Profiler.end(n + ' (Component)');
    }
  }

  @:generic
  public static function state<T:{}>(t:Class<T>):Component<T> {
    return components.get(Type.getClassName(t));
  }

  @:generic
  public static function initComponent<T:{}>(t:Class<T>, decl:ComponentDeclaration):Void {
    components.set(Type.getClassName(t), new Component<T>(decl));
  }
}