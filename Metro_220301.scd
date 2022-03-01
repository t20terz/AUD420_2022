# AUD420_2022
SynthDef("metro", {
	Out.ar(0, WhiteNoise.ar(0.1).perc)
}).add;
Synth("metro");

Synth("metro");

{WhiteNoise.ar(0.1).perc} +> \test
