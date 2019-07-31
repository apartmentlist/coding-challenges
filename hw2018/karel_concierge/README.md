## Karel Concierge

In 2019 we plan to improve our offering to renters with state of the art new services.
One of the more promising ideas is to drive renters to any property they would like
to tour. Since hiring humans to drive cars is prohibitively expensive for a company of
our size, we've decided to employ autonomous vehicles. We've reached out to Uber,
Google, and Cruise to investigate partnerships, but these companies are large and
move too slowly for our needs.

Thus we've decided to build the technology in-house! Using
[Karel](https://github.com/apartmentlist/karel-interpreter) as the foundation for
this work, your task is to develop a program that will take a renter from her home
to the property she scheduled a tour at.

For the sake of this challenge, Karel starts at the renter's home--location (0, 0)
on the Karel grid--and needs to take the renter to the property--location (12, -5)
on the Karel grid. When Karel arrives at the property, it must `put` the renter in
the property's square. In short, the output should look like

```
% karel my_program.krl
location: (XXX, YYY)
direction: anywhichway
tokens: [{"location"=>"(12, -5)", "count"=>1}]
operations: NNN
```

Where the `tokens: ...` line matches this output exactly. The final location and
direction are unimportant.

### Submission Guide

To submit your program, fork this repo and place your Karel program file in a
subdirectory of the form with your GitHub username (e.g. `<FORKED REPO>/hw2018/karel_concierge/tcollier/renter_driver.rb`), open a PR against this repository and tag @tcollier. Submissions must be received before Thursday,
November 29 at 11:59:59 PM PST to be eligible. Only one submission per person will
be eligible for Hack Week Tokens.

A submission that correctly leaves the renter at the property (and nowhere else) will
earn you five tokens. The first person to submit a correct solution will receive an
additional five tokens.
