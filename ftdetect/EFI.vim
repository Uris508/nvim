augroup filetype
  au ColorScheme,BufRead,BufNewFile,BufEnter *.uni setf uni
  au ColorScheme,BufRead,BufNewFile,BufEnter *.uni set syntax=c.uni.doxygen
  au ColorScheme,BufRead,BufNewFile,BufEnter *.vfr,*.hfr,*.Vfr,*.sd setf vfr
  au ColorScheme,BufRead,BufNewFile,BufEnter *.vfr,*.hfr,*.Vfr,*.sd set syntax=c.doxygen.vfr
  au ColorScheme,BufRead,BufNewFile,BufEnter *.inf setf uefi
  au ColorScheme,BufRead,BufNewFile,BufEnter *.inf,*.inc set syntax=uefi.doxygen
  au ColorScheme,BufRead,BufNewFile,BufEnter *.dec,*.dsc,*.fdf setf uefi
  au ColorScheme,BufRead,BufNewFile,BufEnter *.dxs setf c.doxygen
  au ColorScheme,BufRead,BufNewFile,BufEnter *.inf,*.inc,*.dec,*.dsc,*.fdf setlocal commentstring=#\ %s
  au ColorScheme,BufRead,BufNewFile,BufEnter *.asl,*.vfr,*.hfr,*.Vfr,*.uni,*.sd setlocal commentstring=//\ %s
  au ColorScheme,BufRead,BufNewFile,BufEnter *.asl,*.dsl,*.asi setf asl 
augroup end
