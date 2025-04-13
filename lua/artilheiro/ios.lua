local M = {}

M.build_and_run = function()
  local cmd = {
    "xcodebuild",
    "-workspace", "MyApp.xcworkspace",
    "-scheme", "MyApp",
    "-sdk", "iphonesimulator",
    "-configuration", "Debug",
    "-destination", "platform=iOS Simulator,name=iPhone 15"
  }

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          print(line)
        end
      end
    end,
    on_stderr = function(_, data)
      if data then
        for _, line in ipairs(data) do
          print("ERR: " .. line)
        end
      end
    end,
    on_exit = function()
      print("✅ Xcode build finished")
    end
  })
end

return M
