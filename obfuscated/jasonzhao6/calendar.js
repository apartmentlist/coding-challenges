// Copy paste into Chrome console.

[[
    'Jan','Feb','Mar','Apr','May','Jun',
    'Jul','Aug','Sep','Oct','Nov','Dec'

  ].slice(6,11).map(e=>e[0]),' ',
  new Date().toISOString().slice(-1),
  [History,Array,Object].map(e=>e.name[0])

].flat().join('')
