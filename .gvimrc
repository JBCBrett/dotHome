
"color desert
color murphy


highlight StatusLine guifg=grey90 guibg=grey30
highlight StatusLineNC guifg=grey20 guibg=grey25

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif
