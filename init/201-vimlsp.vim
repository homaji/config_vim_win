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

     nnoremap <buffer> gd :<C-u>LspDefinition<CR>
     nnoremap <buffer> gD :<C-u>LspReferences<CR>
     nnoremap <buffer> K  :<C-u>LspHover<CR>
    
endfunction

" ファイルの変更に伴いリアルタイムにエラーを表示するDiagonosticを有効化
let g:lsp_diagnostics_enabled = 1
" 自動で入力補完ポップアップを表示する設定
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
" popupを表示するまでの遅延時間
let g:asyncomplete_popup_delay = 200
