vt=$(fgconsole 2>/dev/null)
(( vt == 1 )) && exec startx -- vt$vt
unset vt
