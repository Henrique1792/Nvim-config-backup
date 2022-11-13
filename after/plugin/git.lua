--maps speedup
local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

--gitsigns
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<localleader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<localleader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<localleader>hS', gs.stage_buffer)
    map('n', '<localleader>hu', gs.undo_stage_hunk)
    map('n', '<localleader>hR', gs.reset_buffer)
    map('n', '<localleader>hp', gs.preview_hunk)
    map('n', '<localleader>hb', function() gs.blame_line{full=true} end)
    map('n', '<localleader>tb', gs.toggle_current_line_blame)
    map('n', '<localleader>hd', gs.diffthis)
    map('n', '<localleader>hD', function() gs.diffthis('~') end)

  end
}
--git related maps
Map('n', '<F5>', ':Gvdiffsplit!<CR>',{noremap=true})
Map('n', '<F8>', ':FzfLua git_bcommits<CR>',{noremap=true})
Map('n', '<F9>', ':FzfLua git_commits<CR>',{noremap=true})
Map('n', '<F12>', ':Git blame<CR>',{noremap=true})

