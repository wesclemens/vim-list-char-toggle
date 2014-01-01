let g:toggle_list = 1
let b:original_colorcolumn = &colorcolumn
function! ToggleList()
    if exists("g:toggle_list")
        if !exists("b:toggle_list_state")
            let b:toggle_list_state = &list ? 1 : 0
        endif
        let b:toggle_list_state = (b:toggle_list_state + 1) % 4
        if b:toggle_list_state == 0
            set nolist
            execute 'set colorcolumn='.b:original_colorcolumn
            echo 'nolist'
        elseif b:toggle_list_state == 1
            set list
            if (version >= 700)
                set listchars=tab:»\ ,trail:·,nbsp:·
            else
                set listchars=tab:»\ ,trail:·
            endif
            execute 'set colorcolumn='.b:original_colorcolumn
            echo 'list'
        elseif b:toggle_list_state == 2
            set list
            if (version >= 700)
                set listchars=tab:»\ ,trail:·,eol:¶,nbsp:·
            else
                set listchars=tab:»\ ,trail:·,eol:¶
            endif
            execute 'set colorcolumn='.b:original_colorcolumn
            echo 'more list'
        elseif b:toggle_list_state == 3
            set list
            if (version >= 700)
                set listchars=tab:»\ ,trail:·,eol:¶,nbsp:·
            else
                set listchars=tab:»\ ,trail:·,eol:¶
            endif
            let tabstops = []
            if &softtabstop != -1 && &softtabstop != 0
              let index = &softtabstop
              let tabwidth = &softtabstop
            else
              let index = &shiftwidth
              let tabwidth = &shiftwidth
            endif
            while index <= &textwidth
              let tabstops = add(tabstops, index)
              let index = index + tabwidth
            endwhile
            execute 'set colorcolumn='.join(tabstops, ',')
            echo 'most list'
        endif
    else
        set list!
    endif
endfunction
silent call ToggleList() " Turn it on

