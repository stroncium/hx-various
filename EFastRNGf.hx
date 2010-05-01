#if !flash
  #error
#end

typedef EFastRNG =  UInt;

class EFastRNGf{
  static inline var FLOAT_MULT = 0.00000000046566128742;
  static inline var UINT_MULT = 4294967295;

  public static function create(?seed:UInt = 0):EFastRNG{
    if(seed == 0)
      seed = newSeed();
    return seed;
    }

  public static inline function next(w:EFastRNG):EFastRNG{
    var t:UInt = (w^(w<<11));
    return (w ^ (w >> 19))^(t ^ (t >> 8));
    }

  public static inline function asUInt(w:EFastRNG):UInt{
    return w;
    }

  public static inline function asInt(w:EFastRNG):Int{
    return w - 2147483647;
    }

  public static inline function asBoundInt(w:EFastRNG, bound:Int){
    return w % bound;
    }

  public static inline function asBoundsFloat(w:EFastRNG, lbound:Float, rbound:Float){
    return lbound+((rbound-lbound)*FLOAT_MULT*w);
    }

  public static inline function asBoundsInt(w:EFastRNG, lbound:Int, rbound:Int){
    return lbound+Std.int((rbound-lbound)*FLOAT_MULT*w);
    }

  public static inline function asBool(w:EFastRNG):Bool{
    return (w & 8) > 0;
    }

  public static inline function asFloat(w:EFastRNG):Float{
    return w * FLOAT_MULT;
    }

  public static function newSeed():UInt{
    return Std.int(Math.random() * UINT_MULT);
    }
  }
