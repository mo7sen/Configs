call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <Expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <Expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

call wilder#set_option('modes', ['/', '?', ':'])

