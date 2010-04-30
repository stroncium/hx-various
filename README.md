[alert]: https://assets1.github.com/images/icons/public.png  "=]"

FastRNG.hx - fast Random Number Generator.
----------
  + flash only.
  + ![Alert!][alert] ~15 times faster than Math.random() (for flash).
  + getUInt, getInt, getFloat, getBool, getBoundInt, getBoundsInt.
  + fast reinitialization with UInt number.
  + ![Alert!][alert] it's ~3.5 times faster to get a number(int, float, bounded int, 2-bounded int) from RNG than from Array.

FastRNG4.hx - fast Random Number Generator with extended period.
-----------
  + period is much longer(^4) than FastRNG's one.
  + 40% slower than FastRNG.
  + everything else is the same.
