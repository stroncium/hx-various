import stron.StopWatch;
using EFastRNGf;
import EFastRNGf;

class TestFastRNG{

  static inline var ITERATIONS = 10000000;

  public static function main(){
    //~ test_efrng();
    haxe.Timer.delay(callback(test, ITERATIONS), 1000);
    }

  static function test_efrng(){
    try{

    var seed = FastRNG.newSeed();
    var efrng:EFastRNG = EFastRNGf.create(seed);
    var frng = new FastRNG(seed);
    var i = 100000000;
    var sum = 0.0;
    while(i --> 0){
      efrng = efrng.next();
      //~ var f = efrng.asFloat();
      var f = efrng.asBoundsFloat(0.0, 100.0);
      //~ if((f < -100.0) || (f > -50.0)){
        //~ throw 'wrong float';
        //~ }
      sum+= f;
      //~ trace(f);
      //~ var r1 = efrng.asUInt();
      //~ var r2 = frng.getUInt();
      //~ if(r1 != r2) throw r1+' != '+r2;
      }
    trace('middle = '+(sum /100000000));
    trace('Everything is ok');
    }catch(e:Dynamic){trace(e);}
    }

  static function test(iter:Int){
    trace('Iterations: '+iter);
    var i;
    var res, res2, resi, resi2, resi3, resi4, resb;
    var w;

    w = new StopWatch('EFastRNG.asUInt');
    i = iter;
    var efrng = EFastRNGf.create();
    while(i --> 0){
      efrng = efrng.next();
      resi = efrng.asUInt();
      }
    w.stop();
    trace(w, null);

    w = new StopWatch("EFastRNG multiple get:\nUInt, Int, BoundInt, BoundsInt Float, BoundsFloat, Bool");
    i = iter;
    var efrng = EFastRNGf.create();
    while(i --> 0){
      efrng = efrng.next();
      resi = efrng.asUInt();
      resi2 = efrng.asInt();
      resi3 = efrng.asBoundInt(12341234);
      resi4 = efrng.asBoundsInt(100, 12341234);
      res = efrng.asFloat();
      res2 = efrng.asBoundsFloat(1.0, 100.0);
      resb = efrng.asBool();
      }
    w.stop();
    trace(w, null);

    w = new StopWatch('EFastRNG.asBoundsInt');
    i = iter;
    var efrng = EFastRNGf.create();
    while(i --> 0){
      efrng = efrng.next();
      resi = efrng.asBoundsInt(100, 123415);
      }
    w.stop();
    trace(w, null);

    w = new StopWatch('EFastRNG.asFloat');
    i = iter;
    var efrng = EFastRNGf.create();
    while(i --> 0){
      efrng = efrng.next();
      res = efrng.asFloat();
      }
    w.stop();
    trace(w, null);

    w = new StopWatch('FastRNG.getUInt');
    i = iter;
    var rng = new FastRNG();
    while(i --> 0)
      resi = rng.getUInt();
    w.stop();
    trace(w, null);

    w = new StopWatch('FastRNG.getFloat');
    i = iter;
    var rng4 = new FastRNG();
    while(i --> 0)
      res = rng4.getFloat();
    w.stop();
    trace(w, null);

    w = new StopWatch('FastRNG4.getUInt');
    i = iter;
    var rng4 = new FastRNG4();
    while(i --> 0)
      resi = rng4.getUInt();
    w.stop();
    trace(w, null);


    w = new StopWatch('FastRNG.getBoundsInt');
    i = iter;
    var res1;
    var rng = new FastRNG();
    while(i --> 0)
      res1 = rng.getBoundsInt(100, 123415);
    w.stop();
    trace(w, null);

    w = new StopWatch('Math.random / 10');
    i = Std.int(iter/10);
    while(i --> 0)
      res = Math.random();
    w.stop();
    trace(w, null);


    var arr = [1234123.1];
    w = new StopWatch('Getting Float from array');
    i = iter;
    while(i --> 0)
      res = arr[0];
    w.stop();
    trace(w, null);

    }
  }
