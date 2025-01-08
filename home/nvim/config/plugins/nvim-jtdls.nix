{ pkgs, ... }:
{
home.file.".config/nvim/lua/plugins/nvim-jtdls.lua".text = ''
-- Java LSP
return {
  -- https://github.com/mfussenegger/nvim-jdtls
  'mfussenegger/nvim-jdtls',
  ft = 'java', -- Enable only on .java file extensions
}
'';
}
