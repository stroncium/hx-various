[alert]: https://assets1.github.com/images/icons/public.png  "=]"

FastRNG.hx - Fast (pseudo)Random Number Generator.
----------
  + flash only.
  + ![Alert!][alert] ~15 times faster than Math.random() (for flash).
  + getUInt, getInt, getFloat, getBool, getBoundInt, getBoundsInt, getBoundFloat.
  + fast reinitialization with UInt number.
  + ![Alert!][alert] it's ~3.5 times faster to get a number(int, float, bounded int, 2-bounded int) from RNG than from Array.

FastRNG4.hx - Fast (pseudo)Random Number Generator with extended period.
-----------
  + period is much longer(^4) than FastRNG's one.
  + 40% slower than FastRNG.
  + everything else is the same.

EFastRNGf.hx - Extremely Fast (pseudo)Random Number Generator.
-----------
  + no object, stored in one UInt(typedefed for EFastRNG);
  + requires import EFastRNGf; + using EFastRNGf;
  + even faster than FastRNG, all inlined.
  + create by calling:

      var efrng:EFastRNG = EFastRNGf.create(seed);

  + update manually:

      efrng = efrng.next();

  + get values:

      var flt = efrng.asFloat();
      var flt2 = efrng.asBoundsFloat(-100.0, 150.0);
      var bl = efrng.asBool();

    You can get em all without progressing RNG, you will get almost no slowdown comparing with getting just one value(if you get values same way, it will be the same).
