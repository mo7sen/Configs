execute 'source' '~/.config/nvim/configs/variables.vim'

call plug#begin('~/.config/nvim/plugs')
  for p in glob('~/.config/nvim/configs/plugs/**/*.vim', 0, 1)
    let split_path = split(p, '/')
    let repo = join([split_path[-2],split_path[-1][:-5]],'/')

    let plug_settings = {}

    let metafile = join([p[:-5], '.meta'], '')
    if filereadable(expand(metafile))
      execute 'source' metafile

      if exists("PlugBranch")
        let plug_settings.branch=PlugBranch
        unlet PlugBranch
      endif

      if exists("PlugPostFunc")
        let plug_settings.do=PlugPostFunc
        unlet PlugPostFunc
      endif

    endif

    execute 'Plug' string(repo) ',' string(plug_settings)

  endfor
call plug#end()

for f in glob('~/.config/nvim/configs/plugs/**/*.vim', 0, 1)
  execute 'source' f
endfor

for f in glob('~/.config/nvim/configs/*.vim', 0, 1)
  execute 'source' f
endfor

function FileTypeHandle()
  let ft_path = join(['~/.config/nvim/configs/filetypes/',&ft,'.vim'], '')
  if filereadable(expand(ft_path))
    execute 'source' ft_path
  endif
endfunction
autocmd FileType * call FileTypeHandle()
