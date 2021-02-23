if empty(globpath(&rtp, 'autoload/lsp.vim'))
    finish
endif

"" Debug conf
"let g:lsp_log_verbose = 1 "デバッグログを出力
"let g:lsp_log_file = expand('~\vimfiles\vimtemp\vim-lsp.log')


"" https://mattn.kaoriya.net/software/vim/20191231213507.htm
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f3> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')



" ファイルの変更に伴いリアルタイムにエラーを表示するDiagonosticを有効化
let g:lsp_diagnostics_enabled = 1
" 自動で入力補完ポップアップを表示する設定
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
" popupを表示するまでの遅延時間
let g:asyncomplete_popup_delay = 200
" LSP仕様のtexteditを有効化
let g:lsp_text_edit_enabled = 1
