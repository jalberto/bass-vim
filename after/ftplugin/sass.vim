setlocal foldmethod = indent

" scss to sass
command Scss2Sass %s/\s\?{\|;\|}//g
