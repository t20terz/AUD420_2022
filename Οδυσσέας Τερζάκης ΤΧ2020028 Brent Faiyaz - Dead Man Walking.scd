(
SynthDef(\melody1, {
    arg out = 0, freq = 440, dur = 1, amp = 0.3;
    var env = EnvGen.ar(Env.new([0, 1, 1, 0], [0, dur - 0.1, 0.1], \lin, -4), doneAction: 2);
    var vibratoRate = 6;
    var vibratoDepth = 10;
    var vibrato = SinOsc.kr(vibratoRate, 0, vibratoDepth, freq);
	var sig = Saw.ar((freq + vibrato) / 2) * env * amp;
    Out.ar(out, sig);
}).add;

SynthDef(\melody2, {
    arg out = 1, freqs = [440, 440, 440, 440], dur = 1, amp = 0.3;
    var env = EnvGen.ar(Env.new([0, 1, 1, 0], [0, dur - 0.1, 0.1], \lin, -4), doneAction: 2);
    var sig = SinOsc.ar(freqs) * env * amp;
    Out.ar(out, sig);
}).add;

SynthDef(\melody3, {
    arg out = 1, freq = 174.614, dur = 0.5, amp = 0.4;
    var env = EnvGen.ar(Env.perc(0.01, dur, 0.8), doneAction: 2);
    var sig = SinOsc.ar(freq * 2) * env * amp;
    Out.ar(out, sig);
}).add;

SynthDef(\melody4, {
    arg out = 0, freqs = [87.307, 65.406, 55, 82.407, 61.735, 49], dur = 0.5, amp = 0.3;
    var env = EnvGen.ar(Env.perc(0.01, dur, 0.8), doneAction: 2);
    var sig = SinOsc.ar(freqs * 2) * env * amp;
    Out.ar(out, sig);
}).add;

SynthDef(\melody5, {
    arg out = 0, freq = 440, dur = 1, amp = 0.3;
    var env = EnvGen.ar(Env.new([0, 1, 1, 0], [0, dur - 0.1, 0.1], \lin, -4), doneAction: 2);
    var sig = SinOsc.ar(freq / 4) * env * amp;
    Out.ar(out, sig);
}).add;

Pbind(
    \instrument, \melody1,
    \out, 0,
    \freq, Pseq([440 * (2 ** ((81 - 69) / 12)), 440 * (2 ** ((79 - 69) / 12))], inf),
    \dur, Pseq([3, 3], inf),
    \amp, 0.3
).play;

Pbind(
    \instrument, \melody2,
    \out, 1,
    \freqs, Pseq([[349.228, 440, 523.251, 659.255], [329.628, 391.995, 493.883, 587.330]], inf),
    \dur, Pseq([3, 3], inf),
    \amp, 0.06
).play;

Pbind(
    \instrument, \melody3,
    \out, 1,
    \freq, Pn(Pseq([87.307, 130.813, 87.307, 82.407, 123.471, 82.407], inf), inf, inf, [
        0, 0.937, 1.312, 3.0, 3.937, 4.312
    ]),
    \dur, Pseq([0.937, 0.375, 1.688, 0.937, 0.375, 1.688], inf),
    \amp, 0.4
).play;

Pbind(
    \instrument, \melody4,
    \out, 0,
    \freqs, Pn(Pseq([87.307, 65.406, 55, 82.407, 61.735, 49], inf), inf, inf, [
        0, 0.937, 1.312, 3.0, 3.937, 4.312
    ]),
    \dur, Pseq([0.937, 0.375, 1.688, 0.937, 0.375, 1.688], inf),
    \amp, 0.4
).play;

Pbind(
    \instrument, \melody5,
    \out, 0,
    \freq, Pseq([440 * (2 ** ((65 - 69) / 12)), 440 * (2 ** ((64 - 69) / 12))], inf),
    \dur, Pseq([3, 3], inf),
    \amp, 0.2
).play;

Pbind(
    \instrument, \melody5,
    \out, 1,
    \freq, Pseq([440 * (2 ** ((65 - 69) / 12)), 440 * (2 ** ((64 - 69) / 12))], inf),
    \dur, Pseq([3, 3], inf),
    \amp, 0.2
).play;
)
