/*           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *                    Version 2, December 2004
 *
 * Copyright (C) 2004 Sam Hocevar 14 rue de Plaisance, 75014 Paris, France
 * Everyone is permitted to copy and distribute verbatim or modified
 * copies of this license document, and changing it is allowed as long
 * as the name is changed.
 *
 *            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *
 *  0. You just DO WHAT THE FUCK YOU WANT TO.
 * */

/* Yanis Benson <yanis.benson@gmail.com> */

#if !flash
  #error
#end

class FastRNG{
  static inline var FLOAT_MULT = 0.00000000046566128742;
  static inline var UINT_MULT = 4294967295;

  var w:UInt;

  public function new(?seed:UInt = 0){
    if(seed == 0)
      seed = newSeed();
    init(seed);
    }

  public inline function getUInt():UInt{
    var t:UInt = (w^(w<<11));
    return w = (w ^ (w >> 19))^(t ^ (t >> 8));
    }

  public inline function getInt():Int{
    return getUInt() - 2147483647;
    }

  public inline function getBoundInt(bound:Int){
    return getUInt() % bound;
    }

  public inline function getBoundsFloat(lbound:Float, rbound:Float){
    return lbound+((rbound-lbound)*FLOAT_MULT*getUInt());
    }

  public inline function getBoundsInt(lbound:Int, rbound:Int){
    return lbound+Std.int((rbound-lbound)*FLOAT_MULT*getUInt());
    }

  public inline function getBool():Bool{
    return (getUInt() & 8) > 0;
    }

  public inline function getFloat():Float{
    return getUInt() * FLOAT_MULT;
    }

  public inline function init(seed:UInt){
    w = seed;
    }

  public static function newSeed():UInt{
    return Std.int(Math.random() * UINT_MULT);
    }
  }
