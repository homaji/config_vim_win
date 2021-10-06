if empty(globpath(&rtp, 'autoload/lightline.vim'))
    finish
endif

set ambiwidth=double

""lightline""
set laststatus=2
let g:lightline = { 
        \'colorscheme': 'iceberg'
        \,
        \'active': {
        \  'left':[ ['hello','mode', 'paste'], ['readonly','modified'],['filename'] ],
        \  'right':[ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ],
        \},
        \'component_function': {
        \    'bufnum': 'Mybufnum',
        \    'winnum': 'Mywinnum',
        \    'tabnum': 'Mytabnum',
        \ },
        \ 'separator': { 'left': "", 'right': "" }, 
        \ 'subseparator': { 'left': "", 'right': "" },
        \ 'tabline_subseparator': { 'left': "" , 'right': "" },
        \ 'tabline':{'right':[['winnum'],['tabnum'],['bufnum']]},
        \ 'tab': {'active':['prefix','filename']}
        \}


function! MyFilename()
    return  ' ' ! = expand('%:F') ? expand('%:F') : '[No Name]'
endfunction

function! Mybufnum()
        let str = "B" . bufnr('%') . "/" . bufnr('$')
        return str
endfunction

function! Mytabnum()
        let str = "T" . tabpagenr( ) . "/" . tabpagenr('$')
        return str
endfunction

function! Mywinnum()
        let str = "W" . winnr( ) . "/" . winnr('$')
        return str
endfunction
