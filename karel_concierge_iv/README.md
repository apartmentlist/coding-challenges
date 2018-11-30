## Karel Concierge - Part IV

Oh, you thought we were done, did you? As if a solution to a single set of hard-coded
inputs is a production-grade app. Nope, Karel is too powerful a language for that
to be a satisfying end state.

In [Part I](../karel_concierge/) of the Karel Concierge challenge you wrote a
program that takes a renter to visit a property she added to her Short List. In
[Part II](../karel_concierge_ii) you extended the program to take the renter to
all properties on her Short List. In
[Part III](../karel_concierge_iii) you optimized the program for a power user.
Continuing down the path of turning this prototype into the back-end service that
will help Apartment List blow away our competition in 2019 and beyond, the next
phase is for Karel to work with dynamic input.

To solve this phase write a Karel program that takes a Karel input file (`*.kin`)
that has two piles of tokens and execute a program that leaves Karel in a specific
final state. The number of tokens in the `(-2, -1)` square indicates the `X` coordinate
of the property and the number of tokens in the `(-1, -1)` square indicates the `Y`
coordinate of the property. All property coordinates are non-negative integers.

For the [example input file](example.kin) (see below) indicates that the property
is at `(12, 5)`

```
tokens: [{"location":"(-2, -1)","count":12},{"location":"(-1, -1)","count":5}]
```

The requirement for this challenge is to have Karel end on the square indicated by
the two token piles in the initial state file. The files used to validate your
program will no be shared ahead of time. A correct solution to the example input
would produce output like

```
% karel -i example.kin my_program.krl
location: (12, 5)
direction: anywhichway
tokens: doesntmatter
operations: NNN
```

Where the `location: (12, 5)` line matches this output. The state of other lines (e.g.
tokens) is unimportant.

### Submission Guide

To submit your program, fork this repo and place your Karel program file in a
subdirectory of the form with your GitHub username (e.g. `<FORKED REPO>/karel_concierge_iv/tcollier/renter_driver.rb`), open a PR against this repository and tag @tcollier. Submissions must be received before Friday,
November 30 at 02:00:00 PM PST to be eligible. Only one submission per person will
be eligible for Hack Week Tokens.

A submission that correctly leaves Karel at the designated square on the board for
all test files (which are hidden from contestants) will earn you five tokens. The first
person to submit a correct solution will receive an additional five tokens.
