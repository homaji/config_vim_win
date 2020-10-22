if empty(globpath(&rtp, 'autoload/lsp.vim'))
    finish
endif

"" Debug conf
let g:lsp_log_verbose = 1 "デバッグログを出力
let g:lsp_log_file = expand('~\vimfiles\vimtemp\vim-lsp.log')


"" Conf LSP Server
augroup MyLsp
    autocmd!
    " 事前にpip install python-language-server
    if executable('pyls')
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'pyls',
                    \ 'cmd': { server_info -> ['pyls'] },
                    \ 'whitelist': ['python'],
                    \'workspace_config': {'pyls': {'plugins':{
                    \   'pycodestyle': {'enabled': v:false},
                    \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
                    \})
        autocmd FileType python call s:configure_lsp()
    endif
augroup END

function! s:configure_lsp() abort
    setlocal omnifunc=lsp#complete "オムニ補完を有効化
    
endfunction

