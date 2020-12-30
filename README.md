# tidalp5

Examples for sending OSC messages to to visualize TidalCycles patterns with Processing.

You'll need to take your existing BootTidal.hs and change the startTidal.

```haskell
:{
tidal <- startMulti [superdirtTarget {oLatency = 0.2, oAddress = "127.0.0.1", oPort = 57120
                                     },
                     superdirtTarget {oLatency = 0.2, oAddress = "127.0.0.1", oPort = 2020,
                                      oTimestamp = NoStamp
                                     }
                    ] (defaultConfig {cFrameTimespan = 1/20})
:}
```

Or, you can also send OSC message addig commands in startup.scd in SuperCollider.

```supercollider
//OSC for p5dirt
var addr = NetAddr.new("127.0.0.1", 2020);
OSCFunc({
    arg msg, time;
    var latency = time - Main.elapsedTime;
    addr.sendBundle(latency, msg);
    },
'/play2').fix;
```
