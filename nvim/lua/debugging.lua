local dap_ok, dap = pcall(require, 'dap')

if not (dap_ok) then
  print("Failed to load DAP.")
  print("Is 'nvim-dap' installed?")
  return
end


dap.set_log_level('INFO')

dap.adapters["deno"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
}

dap.adapters["node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath('data') .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}"
    },
  }
}
dap.configurations.typescript = {
  {
    type = 'deno',
    request = 'launch',
    name = "Deono Debugging",
    runtimeExecutable = "deno",
    runtimeArgs = {
      "run",
      "--inspect-wait",
      "--allow-all"
    },
    program = "${file}",
    cwd = "${workspaceFolder}",
    attachSimplePort = 9229,
  },
}
require('dap.ext.vscode').load_launchjs(nil, {})
