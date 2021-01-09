let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ 'NONE', 'NONE', 0,  4, 'bold' ], [ 'NONE', 'NONE', 15, 0 ] ]
let s:p.normal.right    = [ [ 'NONE', 'NONE', 15, 8 ], [ 'NONE', 'NONE', 7,  0 ] ]
let s:p.normal.middle   = [ [ 'NONE', 'NONE', 8, 0 ] ]
let s:p.normal.error    = [ [ 'NONE', 'NONE', 1, 0 ] ]
let s:p.normal.warning  = [ [ 'NONE', 'NONE', 3, 0 ] ]
let s:p.insert.left     = [ [ 'NONE', 'NONE', 0, 2 ], s:p.normal.left[1] ]
let s:p.visual.left     = [ [ 'NONE', 'NONE', 0, 3 ], s:p.normal.left[1] ]
let s:p.replace.left    = [ [ 'NONE', 'NONE', 0, 1 ], s:p.normal.left[1] ]
let s:p.inactive.left   = [ [ 'NONE', 'NONE', 8, 0 ], [ 'NONE', 'NONE', 7, 0 ] ]
let s:p.inactive.right  = [ [ 'NONE', 'NONE', 8, 0 ], [ 'NONE', 'NONE', 7, 0 ] ]
let s:p.inactive.middle = s:p.normal.middle
let s:p.tabline.middle  = s:p.normal.middle
let s:p.tabline.tabsel  = [ [ 'NONE', 'NONE', 7, 0 ] ]
let s:p.tabline.right   = s:p.normal.right

let g:lightline#colorscheme#bitmap#palette = lightline#colorscheme#fill(s:p)
