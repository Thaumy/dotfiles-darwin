-- auto switch fcitx

if vim.env.USER == 'root' then return end

local activate_next = false

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    if activate_next then
      vim.system { 'macism', 'com.apple.inputmethod.SCIM.Shuangpin' }
    end
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    local obj = vim.system({ 'macism' }, { text = true }):wait()
    activate_next = obj.stdout == 'com.apple.inputmethod.SCIM.Shuangpin\n'
    vim.system { 'macism', 'com.apple.keylayout.ABC' }
  end,
})
