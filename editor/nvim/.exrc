let g:meson_build_dir = "build"
let g:meson_run_target = "examples/example1"
let g:meson_run_args = ""

if !exists("g:meson_command")
  let g:meson_command = "meson"
endif

if !exists("g:meson_compile_command")
  let g:meson_compile_command = "compile"
endif

if !exists("g:meson_working_dir")
  let g:meson_working_dir = getcwd()
endif

function! MesonCompile()
  silent !clear
  execute "!" . g:meson_command . " " . g:meson_compile_command . " -C " . g:meson_working_dir . "/" . g:meson_build_dir
endfunction

function! MesonRun()
  silent !clear
  execute "lcd " . g:meson_working_dir . "/" . g:meson_build_dir
  execute "!./" . g:meson_run_target . " " . g:meson_run_args
endfunction


nnoremap <leader>c :call MesonCompile()<cr>
nnoremap <leader>r :call MesonRun()<cr>
