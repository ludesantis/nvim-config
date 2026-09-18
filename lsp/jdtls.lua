---@type vim.lsp.Config
return {
  cmd = { "jdtls" },

  filetypes = { "java" },

  root_markers = {
    {
      "mvnw",
      "gradlew",
      "settings.gradle",
      "settings.gradle.kts",
      ".git",
    },
    {
      "pom.xml",
      "build.gradle",
      "build.gradle.kts",
      "build.xml",
    },
  },

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },

      configuration = {
        updateBuildConfiguration = "interactive",
      },

      maven = {
        downloadSources = true,
      },

      implementationsCodeLens = {
        enabled = true,
      },

      referencesCodeLens = {
        enabled = true,
      },

      references = {
        includeDecompiledSources = true,
      },

      signatureHelp = {
        enabled = true,
      },

      contentProvider = {
        preferred = "fernflower",
      },

      format = {
        enabled = true,
      },
    },
  },
}
