local present, ufo = pcall(require, 'ufo')

if not present then
  return
end

local virtual_text_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󱞦 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0

  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)

    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      local hlGroup = chunk[2]

      chunkText = truncate(chunkText, targetWidth - curWidth)
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)

      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end

      break
    end

    curWidth = curWidth + chunkWidth
  end

  table.insert(newVirtText, { suffix, 'MoreMsg' })

  return newVirtText
end

ufo.setup({
  fold_virt_text_handler = virtual_text_handler,
})

local bind = vim.keymap.set

bind('n', 'zR', ufo.openAllFolds)
bind('n', 'zM', ufo.closeAllFolds)
