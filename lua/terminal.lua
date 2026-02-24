local M = {}

local terminals = {}

local function open_term(cmd, opts)
  opts = opts or {}
  local key = opts.key or "default"

  if terminals[key] and vim.api.nvim_buf_is_valid(terminals[key].buf) then
    vim.api.nvim_set_current_win(terminals[key].win)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)

  local win
  if opts.float then
    local width  = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row    = math.floor((vim.o.lines - height) / 2)
    local col    = math.floor((vim.o.columns - width) / 2)

    win = vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      row = row,
      col = col,
      width = width,
      height = height,
      border = "rounded",
    })
  else
    vim.cmd(opts.vertical and "vsplit" or "split")
    win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, buf)
  end

  vim.fn.termopen(cmd or vim.o.shell)
  vim.cmd("startinsert")

  vim.bo[buf].buftype = "terminal"
  vim.bo[buf].bufhidden = "hide"
  vim.bo[buf].swapfile = false

  terminals[key] = { buf = buf, win = win }
end

function M.float()
  open_term(nil, { float = true, key = "float" })
end

function M.horizontal()
  open_term(nil, { key = "horizontal" })
end

function M.vertical()
  open_term(nil, { vertical = true, key = "vertical" })
end

return M
