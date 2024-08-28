augroup filetype
  au ColorScheme,BufRead,BufNewFile *.uni setf uni
  au ColorScheme,BufRead,BufNewFile *.uni set syntax=c.uni.doxygen
  au ColorScheme,BufRead,BufNewFile *.vfr,*.hfr,*.Vfr,*.sd setf vfr
  au ColorScheme,BufRead,BufNewFile *.vfr,*.hfr,*.Vfr,*.sd set syntax=c.doxygen.vfr
  au ColorScheme,BufRead,BufNewFile *.inf setf uefi
  au ColorScheme,BufRead,BufNewFile *.inf,*.inc set syntax=uefi.doxygen
  au ColorScheme,BufRead,BufNewFile *.dec,*.dsc,*.fdf setf uefi
  au ColorScheme,BufRead,BufNewFile *.dxs setf c.doxygen
  au BufRead,BufNewFile *.inf,*.inc,*.dec,*.dsc,*.fdf setlocal commentstring=#\ %s
  au BufRead,BufNewFile *.asl,*.vfr,*.hfr,*.Vfr,*.uni,*.sd setlocal commentstring=//\ %s
augroup end
