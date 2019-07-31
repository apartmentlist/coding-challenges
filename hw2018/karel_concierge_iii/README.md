## Karel Concierge - Part III

In [Part I](../karel_concierge/) of the Karel Concierge challenge you wrote a
program that takes a renter to visit a property she added to her Short List. In
[Part II](../karel_concierge_ii) you extended the program to take the renter to
all properties on her Short List. Now we need to stress test the algorithm! In
this challenge we identified a renter with a very long Short List and would like
to take him to each of the properties he's expressed interest in.

The good folks at Karel.org have created a v0.2.0 version of the
[Karel interpreter](https://github.com/apartmentlist/karel-interpreter) that
allows us to initialize the Karel board before executing a program. As such, we
will depart from using `put` to demonstrate that Karel has arrived at a property
and instead initialize the board with tokens at the property and require that
Karel `pick` the tokens when it visits the property. Use the Karel initialization file
[short_list.kin](short_list.kin) and your program to produce a Karel board with
zero remaining tokens. After your program executes, the output should look like

```
% karel -i short_list.kin my_program.krl
location: (XXX, YYY)
direction: anywhichway
tokens: []
operations: NNN
```

Where the `tokens: []` line matches this output. The final location and
direction are unimportant.

### Submission Guide

To submit your program, fork this repo and place your Karel program file in a
subdirectory of the form with your GitHub username (e.g. `<FORKED REPO>/hw2018/karel_concierge_iii/tcollier/renter_driver.rb`), open a PR against this repository and tag @tcollier. Submissions must be received before Thursday,
November 29 at 11:59:59 PM PST to be eligible. Only one submission per person will
be eligible for Hack Week Tokens.

A submission that correctly removes all tokens from the board will
earn you five tokens. The first person to submit a correct solution will receive an
additional five tokens. The most efficient correct solution (i.e. the solution consuming
the fewest number of operations) will receive an additional fifteen tokens (if there is
a tie for the most efficient program, only the first submitted entry will win the tokens).
