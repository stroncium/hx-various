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
  static inline var Y:UInt = 842502087;
  static inline var Z:UInt = 3579807591;
  static inline var W:UInt = 273326509;

  static inline var FLOAT_MULT = 1/4294967295;
  static inline var UINT_MULT = 4294967295;

  var x:UInt;
  var y:UInt;
  var z:UInt;
  var w:UInt;

  public function new(?seed:UInt = 0){
    if(seed == 0)
      init(newSeed);
    else
      init(seed);
    }

  public inline function getUInt():UInt{
    var t:UInt = (x^(x<<11));
    x = y; y = z; z = w;
    return w = (w ^ (w >> 19))^(t ^ (t >> 8));
    }

  public inline function getInt():Int{
    return getUInt() - 2147483647;
    }

  public inline function getIntBound(bound:Int){
    return Std.int(bound*FLOAT_MULT*getUInt());
    }

  public inline function getIntBounds(lbound:Int, rbound:Int){
    return lbound+Std.int((rbound-lbound)*FLOAT_MULT*getUInt());
    }

  public inline function getBool():Bool{
    return (getUInt() & 1) > 0;
    }

  public inline function getFloat():Float{
    return getUInt() * FLOAT_MULT;
    }

  public inline function init(seed:UInt){
    x = seed;
    y = Y; z = Z; w = W;
    }

  public static function newSeed():UInt{
    return Std.uint(Math.random() * UINT_MULT);
    }
  }
