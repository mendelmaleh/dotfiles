" storage
let cache = $HOME."/.local/cache"
if !isdirectory(cache)
  call mkdir(cache)
endif

let &backupdir=cache
let &directory=cache
