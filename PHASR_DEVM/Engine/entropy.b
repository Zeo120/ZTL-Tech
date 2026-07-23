implement EntropyAnalyzer;

include "sys.m";
    sys: Sys;
include "math.m";
    math: Math;
include "draw.m";

EntropyAnalyzer: module
{
    init: fn(ctxt: ref Draw->Context, args: list of string);
    calculate_entropy: fn(buffer: array of byte): real;
};

init(ctxt: ref Draw->Context, args: list of string)
{
    sys = load Sys Sys->PATH;
    math = load Math Math->PATH;
    
    sys->print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    sys->print("MODULE 3 — ABSOLUTE ENTROPY (LIMBO/DIS)\n");
    sys->print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    sys->print("Executing hardware physics across distributed Plan 9 Styx nodes...\n");
}

calculate_entropy(buffer: array of byte): real
{
    counts := array[256] of { * => 0.0 };
    length := len buffer;
    
    if (length == 0)
        return 0.0;
        
    # Rip through the distributed byte stream
    for (i := 0; i < length; i++) {
        counts[int buffer[i]] += 1.0;
    }
    
    entropy := 0.0;
    for (i = 0; i < 256; i++) {
        if (counts[i] > 0.0) {
            p := counts[i] / real length;
            
            # Limbo math module implements base-e log or base-10 log,
            # We calculate base-2 log using change of base formula: ln(p) / ln(2)
            entropy -= p * (math->log(p) / math->log(2.0));
        }
    }
    
    return entropy;
}
