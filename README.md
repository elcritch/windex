# Windex

**This is a spinoff of [Windy](https://github.com/treeform/windy)** partly to handle Nimble issues with conflicting URL's and also to customize it for Figuro a bit more. Note I'd love to merge new stuff back to Windy, but the development their appears stale for the last couple of years.

Windex is a windowing library for Nim that uses OS native APIs to manage windows, set up OpenGL and receive mouse and keyboard input.

`nimble install windex`

![Github Actions](https://github.com/treeform/windex/workflows/Github%20Actions/badge.svg)

[API reference](https://treeform.github.io/windex)

Windex will work great for 2D and 3D OpenGL games as well as GUI apps using OpenGL. Using this library should feel similar to GLFW or SDL.

Features:
* Multi-platform (Windows, macOS, Linux)
* Manage one or many windows
* Customizable windows (resizable, hidden, fullscreen and more)
* Use custom window icons and cursors
* DPI and content-scaling aware
* Mouse input (position, clicks, scroll)
* Double-click, triple-click and quadruple-click events
* Keyboard input (key events + unicode)
* Easy polling of keyboard state via `buttonDown[Button]` and more
* IME support (for Chinese, Japanese etc text input)
* System clipboard (copy and paste) support
* Show a system tray icon and menu (Windows only)
* Non-blocking HTTP requests and WebSockets

## Basic Example

```nim
import opengl, windex

let window = newWindow("Windex Example", ivec2(1280, 800))

window.makeContextCurrent()
loadExtensions()

proc display() =
  glClear(GL_COLOR_BUFFER_BIT)
  # Your OpenGL display code here
  window.swapBuffers()

while not window.closeRequested:
  display()
  pollEvents()
```

[Check out more examples here.](https://github.com/treeform/windex/tree/master/examples)


### Why not just use GLFW or SDL?

Here are a few reasons that may be worth considering:

* Windex is written in Nim so it will be more natural to use than bindings to other libraries. For example, making a window fullscreen is as easy as `window.fullscreen = true`. Consider browsing some of the examples and consider if you would find this Nim-first API more pleasant to work with.

* Windex includes events for double, triple and quadruple clicks. Furthermore, Windex maintains the keyboard and mouse state in a way that makes reacting to input state easier each frame. See `buttonPressed[]`, `buttonDown[]`, `buttonReleased[]` and `buttonToggle[]` on `Window`.

* Windex has IME input support for Chinese, Japanese, Korean and other languages. Text input can also be enabled or disabled at any time (for example, to avoid opening the IME editor when a user just wants to use WASD in a game).
