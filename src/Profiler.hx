
import h2d.Graphics;
import h2d.Scene;

class Profiler {
  public static var obj:Graphics;

  public static var colors:Array<Int> = [0xff2222, 0x22ff22, 0x2222ff];
  
  public static var profiles:Map<String, Array<Float>> = [];
  public static var currentProfile:Map<String, Float>;

  private static var startTime:Float;

  public static function init (s2d:Scene) {
    obj = new Graphics();
    s2d.addChildAt(obj, 10);
    obj.x = 10;
    obj.y = 10;
    currentProfile = new Map<String, Float>();
  }


  public static function start(label:String) {
    currentProfile.set(label, Sys.time());
  }

  public static function end (label:String) {
    var start:Float = currentProfile.get(label);
    currentProfile.set(label, Sys.time() - start);
  }

  private static var frames:Int = 0;
  public static function endFrame (dt:Float) {
    frames++;

    for (k => v in currentProfile) {
      if (profiles[k] == null) profiles[k] = [];
      profiles[k].push(v);
    }
    currentProfile = new Map<String, Float>();
    obj.clear();
    var c = 0;

    var start:Int = cast Math.max(0, frames - 1000);
    var totalH:Array<Float> = [];

    for (profile in profiles) {
      for (idx in start...frames) {
        // if (totalH[idx-start] == null) totalH[idx-start] = 0;5
        var v = profile[idx];
        var h:Float = (v / (0.016666667)) * 1000;
        obj.beginFill(0xff00ff);
        obj.lineStyle(1, colors[c], 1);
        obj.moveTo(idx - start, totalH[idx-start]);
        obj.lineTo(idx - start, totalH[idx-start] + h);
        obj.endFill();
        totalH[idx - start] += h;
      }
      c++;
    }
  }
}