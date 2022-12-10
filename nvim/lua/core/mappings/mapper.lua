local opts_default = {
  silent = true,
  noremap = true,
}

local opts_merge = function(a, b)
  local c = {}
  for k, v in pairs(a) do c[k] = v end
  for k, v in pairs(b) do c[k] = v end
  return c
end

mapper = function(mapping)
  for cmd, opts in pairs(mapping) do
    local mode, lhs, rhs = cmd:match("([^|]*) +(.*) +(.*)")

    vim.api.nvim_set_keymap(
      mode, lhs, rhs,
      opts_merge(opts_default, opts)
    )
  end
end

return mapper
