--maps speedup
local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

--gitsigns
local gitsigns = require('gitsigns')
gitsigns.setup{
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
		Map('n', '<leader>H', gs.preview_hunk)
		Map('n', '<F5>', gs.diffthis)
		Map('n', '<localleader><F12>', gs.toggle_current_line_blame)
		Map('n', '<leader><F12>', gs.blame,{noremap=true})

		-- map({'n', 'v'}, '<localleader>hs', ':Gitsigns stage_hunk<CR>')
		-- map({'n', 'v'}, '<localleader>hr', ':Gitsigns reset_hunk<CR>')
		-- map('n', '<localleader>hS', gs.stage_buffer)
		-- map('n', '<localleader>hu', gs.undo_stage_hunk)
		-- map('n', '<localleader>hR', gs.reset_buffer)
		-- map('n', '<localleader>hD', function() gs.diffthis('~') end)

	end,
	current_line_blame_opts = {
		delay = 10
	}
}

--fzf related maps
Map('n', '<F8>', '<cmd>FzfLua git_bcommits<CR>',{noremap=true})
Map('n', '<F9>', '<cmd>FzfLua git_commits<CR>',{noremap=true})
