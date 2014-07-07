let g:toggle_list = 1
function! ToggleList()
    if exists("g:toggle_list")
        if !exists("b:toggle_list_state")
            let b:toggle_list_state = &list ? 1 : 0
        endif
        let b:toggle_list_state = (b:toggle_list_state + 1) % 3
        if b:toggle_list_state == 0
            set nolist
            echo 'nolist'
        elseif b:toggle_list_state == 1
            set list
            if (version >= 700)
                set listchars=tab:»\ ,trail:·,nbsp:·
            else
                set listchars=tab:»\ ,trail:·
            endif
            echo 'list'
        elseif b:toggle_list_state == 2
            set list
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
silent call ToggleList() " Turn it on

