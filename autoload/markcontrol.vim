let g:toggle_list = 1

function! markcontrol#plugin_on()
  if exists(":SignifyEnable")
    execute 'SignifyEnable'
  endif
  if exists(':IndentLinesEnable')
    execute 'IndentLinesEnable'
  endif
endfunction

function! markcontrol#plugin_off()
  if exists(":SignifyDisable")
    execute 'SignifyDisable'
  endif
  if exists(':IndentLinesDisable')
    execute 'IndentLinesDisable'
  endif
endfunction

function! markcontrol#cycle() abort
  if exists("g:toggle_list")
    if !exists("b:toggle_list_state")
      let b:toggle_list_state = &list ? 2 : 0
    else
      let b:toggle_list_state = (b:toggle_list_state + 1) % 4
    endif

    if b:toggle_list_state == 0
      set nolist
      set nonumber
      call markcontrol#plugin_off()
      echo 'nolist plain text'
    elseif b:toggle_list_state == 1
      set nolist
      set number
      call markcontrol#plugin_on()
      echo 'nolist'
    elseif b:toggle_list_state == 2
      set list
      set number
      call markcontrol#plugin_on()
      if (version >= 700)
        set listchars=tab:»\ ,trail:·,nbsp:·
      else
        set listchars=tab:»\ ,trail:·
      endif
      echo 'list'
    elseif b:toggle_list_state == 3
      set list
      set number
      call markcontrol#plugin_on()
      if (version >= 700)
        set listchars=tab:»\ ,trail:·,eol:¶,nbsp:·
      else
        set listchars=tab:»\ ,trail:·,eol:¶
      endif
      echo 'more list'
    endif
  else
    set list!
  endif
endfunction
