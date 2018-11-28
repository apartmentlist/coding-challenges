## Karel Concierge - Part II

In [part I](../karel_concierge/) of the Karel Concierge challenge you wrote a
program takes a renter to visit a property she added to her Short List. Well, her
feedback was extremely positive and we've decided to double down on the Karel
Concierge. The next step is to support visiting _every_ positive interest on a
renter's Short List.

For the sake of this challenge, use
[Karel](https://github.com/apartmentlist/karel-interpreter) to visit all
listings the renter has on her Short List. The locations (in no particular order)
are

* (12, -5)
* (-17, 21)
* (8, 14)
* (0, 9)
* (-20, -20)
* (4, 2)

Karel starts at the renter's home--location (0, 0)
on the Karel grid--and needs to take the renter to each property
on the Karel grid. When Karel arrives at a property, it must `put` the renter in
the property's square. In short, the output should look like

```
% karel my_program.krl
location: (XXX, YYY)
direction: anywhichway
tokens: [{"location"=>"(-20, -20)", "count"=>1},{"location"=>"(-17, 21)", "count"=>1},{"location"=>"(0, 9)", "count"=>1},{"location"=>"(4, 2)", "count"=>1},{"location"=>"(8, 14)", "count"=>1},{"location"=>"(12, -5)", "count"=>1}]
operations: NNN
```

Where the `tokens: ...` line matches this output exactly. The final location and
direction are unimportant.

### Submission Guide

To submit your program, fork this repo and place your Karel program file in a
subdirectory of the form with your GitHub username (e.g. `<FORKED REPO>/karel_concierge_ii/tcollier/renter_driver.rb`), open a PR against this repository and tag @tcollier. Submissions must be received before Thursday,
November 29 at 11:59:59 PM PST to be eligible. Only one submission per person will
be eligible for Hack Week Tokens.

A submission that correctly leaves the renter at the property (and nowhere else) will
earn you five tokens. The first person to submit a correct solution will receive an
additional five tokens. The most efficient correct solution (i.e. the solution consuming
the fewest number of operations) will receive an additional five tokens.
