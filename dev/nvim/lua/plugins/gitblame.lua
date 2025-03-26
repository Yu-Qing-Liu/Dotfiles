-- Git Blame
return {
  -- https://github.com/f-person/git-blame.nvim
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = true,
    display_virtual_text = 0,
    date_format = '%m/%d/%y %H:%M:%S'
  }
}

