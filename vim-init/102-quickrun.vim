set ambiwidth=double
if empty(globpath(&rtp, 'autoload/quickrun.vim'))
    finish
endif

let g:quickrun_config={'*': {'split': ''}}
" New window
set splitbelow
