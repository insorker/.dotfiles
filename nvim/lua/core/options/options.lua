return {
	global_options = {
		termguicolors = true,

    -- 关闭swap文件
    swapfile = false,

    -- 行号
    number          = true,
    relativenumber  = true,

    -- 退格
    backspace = 'indent,eol,start',

    -- 按键时间
    timeout = true,
    timeoutlen = 500,

    -- 改变dir
    autochdir = true,

    -- 允许virtual editing，:h virtual editing
		virtualedit = 'block',

    -- 必开
    hidden = true,

    -- 括号匹配，%跳转
    showmatch = true,

    -- 分割窗口
    splitbelow = true,
    splitright = true,

    -- 补全
    completeopt = 'menuone,preview,noinsert',
    wildmenu = true,
    
    -- scroll
    sidescrolloff = 5,
    scrolloff = 5,
    showbreak = '↳',
    wrap = false,

    -- mouse
    mouse = 'a',

    -- file
    fileencodings = 'utf-8,ucs-bom,gb18030,gb2312,cp936,default,latin1',
    emoji = true,

    -- search
    ignorecase = true,
    smartcase  = true,
    hlsearch = true,
    incsearch = true,
    magic  = true,

    -- history
    history = 1000,
    
    -- tab
		shiftwidth  = 2,
		tabstop     = 2,
    smartindent = true,
		expandtab   = true,
	},
}
