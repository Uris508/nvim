augroup filetype
  au ColorScheme,BufRead,BufNewFile *.uni setf uni
  au ColorScheme,BufRead,BufNewFile *.uni set syntax=c.uni.doxygen
  au ColorScheme,BufRead,BufNewFile *.vfr setf vfr
  au ColorScheme,BufRead,BufNewFile *.vfr set syntax=c.doxygen.vfr
  au ColorScheme,BufRead,BufNewFile *.hfr setf vfr
  au ColorScheme,BufRead,BufNewFile *.hfr set syntax=c.doxygen.vfr
  au ColorScheme,BufRead,BufNewFile *.Vfr setf vfr
  au ColorScheme,BufRead,BufNewFile *.Vfr set syntax=c.vfr.doxygen
  au ColorScheme,BufRead,BufNewFile *.inf setf uefi
  au ColorScheme,BufRead,BufNewFile *.inf set syntax=uefi.doxygen
  au ColorScheme,BufRead,BufNewFile *.inc set syntax=uefi.doxygen
  au ColorScheme,BufRead,BufNewFile *.dec setf uefi
  au ColorScheme,BufRead,BufNewFile *.dsc setf uefi
  au ColorScheme,BufRead,BufNewFile *.fdf setf uefi
  au ColorScheme,BufRead,BufNewFile *.dxs setf c.doxygen
augroup end
