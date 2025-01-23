import unicode, vmath, windex/common

when defined(windows):
  import windex/platforms/win32/platform
elif defined(macosx):
  import windex/platforms/macos/platform
elif defined(linux):
  import windex/platforms/linux/platform

export common, platform, unicode, vmath
