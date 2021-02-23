" 入力キーの辞書
let s:compl_key_dict = {
      \ char2nr("\<C-l>"): "\<C-x>\<C-l>",
      \ char2nr("\<C-n>"): "\<C-x>\<C-n>",
      \ char2nr("\<C-p>"): "\<C-x>\<C-p>",
      \ char2nr("\<C-k>"): "\<C-x>\<C-k>",
      \ char2nr("\<C-t>"): "\<C-x>\<C-t>",
      \ char2nr("\<C-i>"): "\<C-x>\<C-i>",
      \ char2nr("\<C-]>"): "\<C-x>\<C-]>",
      \ char2nr("\<C-f>"): "\<C-x>\<C-f>",
      \ char2nr("\<C-d>"): "\<C-x>\<C-d>",
      \ char2nr("\<C-v>"): "\<C-x>\<C-v>",
      \ char2nr("\<C-u>"): "\<C-x>\<C-u>",
      \ char2nr("\<C-o>"): "\<C-x>\<C-o>",
      \ char2nr('s'): "\<C-x>s",
      \ char2nr("\<C-s>"): "\<C-x>s"
      \}

" 表示メッセージ
let s:hint_i_ctrl_x_msg = join([
      \ '<C-l>: "行補完"',
      \ '<C-n>: "ファイルの中のキーワード補完"',
      \ '<C-k>: "辞書(dictionary)からの補完"',
      \ '<C-t>: "リスト(thesaurus)からの補完"',
      \ '<C-i>: "外部参照とファイルからのキーワード補完"',
      \ '<C-]>: "タグファイル(tag)"',
      \ '<C-f>: "ファイル名"',
      \ '<C-d>: "マクロもしくは定義からの補完"',
      \ '<C-v>: "Vimコマンドラインからの補完"',
      \ '<C-u>: "ユーザー定義の補完 (completefunc)"',
      \ '<C-o>: "オムニ補完(omnifunc)"',
      \ 's: "スペリング補完 (spell)"'
      \], "\n")

function! s:hint_i_ctrl_x() abort
  echo s:hint_i_ctrl_x_msg
  let c = getchar()
  return get(s:compl_key_dict, c, nr2char(c))
endfunction
 
inoremap <expr> <C-x>  <SID>hint_i_ctrl_x()


