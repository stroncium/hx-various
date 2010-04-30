import stron.StopWatch;

class TestFastRNG{

  static inline var ITERATIONS = 100000000;

  public static function main(){
    haxe.Timer.delay(callback(test, ITERATIONS), 1000);
    }

  static function test(iter){
    var i;
    var res, resi;
    var w;

    w = new StopWatch('FastRNG.getUInt');
    i = iter;
    var rng = new FastRNG();
    while(i --> 0)
      resi = rng.getUInt();
    w.stop();
    trace(w);

    w = new StopWatch('FastRNG4.getUInt');
    i = iter;
    var rng4 = new FastRNG4();
    while(i --> 0)
      resi = rng4.getUInt();
    w.stop();
    trace(w);

    w = new StopWatch('FastRNG.getBoundsInt');
    i = iter;
    var res1;
    var rng = new FastRNG();
    while(i --> 0)
      res1 = rng.getBoundsInt(100, 123415);
    w.stop();
    trace(w);

    w = new StopWatch('Math.random / 10');
    i = Std.int(iter/10);
    while(i --> 0)
      res = Math.random();
    w.stop();
    trace(w);


    var arr = [1234123.1];
    w = new StopWatch('Getting Float from array');
    i = iter;
    while(i --> 0)
      res = arr[0];
    w.stop();
    trace(w);

    }
  }
