if empty(globpath(&rtp, 'autoload/preview_markdown.vim'))
    finish
endif

""Preview Markdown"

""" Use glow
let g:preview_markdown_parser='glow'
