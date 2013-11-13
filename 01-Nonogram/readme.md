# Brute-force nonogram solver

Solves 5x5 nonograms pretty quickly but chokes on larger ones. Nonogram solving is an NP-complete problem and I didn't try to devise any efficient heuristics, since I was just learning Haskell and a brute-force approach would do.

## Usage

Compile it with GHC:

    ghc Nonogram.hs

Run it:

    ./Nonogram puzzle5x5.txt

## File format

Puzzles are written line by line, horizontal cues first, all numbers separated by spaces.
