require 'lspconfig'.tsserver.setup {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'relative'
    }
  }
}
