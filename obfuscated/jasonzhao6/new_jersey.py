# Copy paste into `python3` console.

from random import Random as Prize

play = list('NJ HAS A ZOO')
raffle_ticket = 77_815_8888
iPod = Prize(raffle_ticket)
iPod.shuffle(play)
''.join(play)[:10]
