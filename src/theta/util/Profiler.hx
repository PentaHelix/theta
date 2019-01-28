package theta.util;


import h2d.Graphics;
import h2d.Scene;
import h2d.Text;

class Profiler {
  public static var colors:Array<Int> = [0x882222, 0x88ff22, 0x222288];
  
  public static var profiles:Map<String, Array<Float>> = [];
  public static var currentProfile:Map<String, Float>;

  private static var obj:Graphics;
  private static var startTime:Float;
  private static var fps:Text;

  public static function init () {
    obj = new Graphics();
    Engine.scene.addChildAt(obj, 10);

    currentProfile = new Map<String, Float>();
    
    var font = hxd.res.DefaultFont.get();
    font.resizeTo(28);
    fps = new Text(font);
    fps.x = 10;
    Engine.scene.addChildAt(fps, 10);
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
   
    // update graphic

    fps.text = Std.int(1 / dt) + " fps";

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
        obj.lineStyle(1, colors[c], 0.8);
        obj.moveTo(idx - start, totalH[idx-start]);
        obj.lineTo(idx - start, totalH[idx-start] + h);
        obj.endFill();
        totalH[idx - start] += h;
      }
      c++;
    }
  }
}