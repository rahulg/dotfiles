function! IncrementZoneSerial()

    " only run if buffer is modified
    if !&modified
        return
    endif

    " store old position and registers
    let curpos = getpos(".")
    let saved_d = @d
    let saved_s = @s

    " find the SOA record and yank the serial
    silent execute ":normal! gg/SOA\r/(\r/\\d\r\"dy8l8l\"sy2l"

	" serials should be in YYYYmmddnn format
	" increment nn if the date matches today's
	" else set new date and reset nn to 01
    let curdate = strftime("%Y%m%d")
    if curdate != @d
        let @s = "01"
    else
        let @s = printf("%02d", @s+1)
    endif
    let @d = curdate

    " paste the serial
    silent execute ":normal! 8h10xh\"dp\"sp"

    " restore cursor position & registers
    call setpos('.', curpos)
    let @d = saved_d
    let @s = saved_s

endfunction

augroup bindzone
    autocmd BufWritePre <buffer> :call IncrementZoneSerial()
augroup end
