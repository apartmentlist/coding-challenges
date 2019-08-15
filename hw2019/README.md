# Hack Week 2019 Coding Challenge

## Simple Logistics and Overland Transportation Handlers

The year is 2021 and Apartment List is the dominant platform to help renters find
homes. However, always looking to improve renter's lives, CEO Jon Kobs refuses to be
satisfied and wants to do more. Last quarter he called for a board retreat to update
the company's strategic vision, which he and COO Chris Erickson had scrawled on a napkin
in 2010 as the foundation for starting Apartment List:

1. Help renters find homes
2. ???
3. Profit!!!

After several intense, day-long sessions the board agreed that step 2 must be to help
renters _get_ to their new homes. As such, Kobs was authorized to acquire a moving and
logistics company to incorporate in the Apartment List platform. Last month Kobs
negotiated a sweetheart deal to acquire Simple Logistics and Overland Transportation
Handlers (SLOTH) Movers.

## Problem

It turns out, the company lives up to its name. Initial feedback from renters using
SLOTH Movers was that deliveries arrived days (if not weeks) later than renters
anticipated.

## Solution

After talking with dozens of unhappy renters, the R&D team has decided to introduce
Super Delivery, a limited capacity transportation device capable of delivering anywhere
in the US in under 24 hours. While the capacity of this device is considerably smaller
than that of a typical household, renters provide an inventory of their possessions with
corresponding day zero values (D0Va)--the relative
utility the renter gets from that possession on the first day in their new home. Assuming
we deliver sufficient D0Va in the Super Delivery device, R&D believes renters will not
mind waiting for their remaining belongings.

### Submission

Kobs has tasked any and all comers to submit a program that will determine which
items will go in the Super Delivery device. The developer that yields a valid
set of items (i.e. the combined weight of the selected items is less than or equal
to the device capacity) with the maximum D0Va will get promoted to CTO and receive
a huge raise!

### Command line arguments

Provide a command line program that takes in

* Name of the file containing the bill of material
* Capacity of the Super Delivery transportation device
* A maximum execution time of the program in seconds

For example

```
% my_solution.sh inventory.csv 100 5
```

In the above example, `inventory.csv` is the file with the inventory (a CSV with item
names, D0Va, and weights; see below), `100` is the capacity of the device to fill, and `5` is
the time in seconds the program has to print out a response (after 5 seconds, the process
will be terminated)

The format for the inventory file is

```
<item 1>,<D0Va of item 1>,<weight of item 1>
<item 2>,<D0Va of item 2>,<weight of item 2>
...
<item N>,<D0Va of item N>,<weight of item N>
```

For example

```
Couch,20,70
Chair,30,40
Jewelry Box,50,4
Bed,100,40
Coffee Table,10,15
Nintendo Switch,250,7
Emergency Kit,25,10
Television,45,150
```

### Program output

The program should output the names of the items that will be loaded in the Super Delivery device.
Each item should be printed on its own line.
Order does not matter.
If any line printed does not match the name of an item exactly, then the submission will
be considered invalid.

Based on the example in the previous section, one possible valid output is

```
Jewelry Box
Coffee Table
Nintendo Switch
Emergency Kit
```

This output has a combined weight of 36 (which is less than the capacity of 100) and
a total D0Va of 335.

The total weight of the printed items must be less than or equal to the capacity passed in.
Do *not* print the total D0Va, that will automatically be calculated for you.

## Submission Guide

To submit your program, fork this repo and place your submission in a
subdirectory of the form with your GitHub username
(e.g. `<FORKED REPO>/hw2019/tcollier/my_solution.sh`),
open a PR against this repository and tag @tcollier.
Submissions must be received before Thursday, August 23 at 02:00:00 PM PST to be eligible.

During the week, I will periodically run all submitted programs against hidden test inventories
and report on the rankings. After the submission deadline, I will run a final round with all
submissions, this is the only round that will be used to determine who becomes CTO and gets
that fat raise!
