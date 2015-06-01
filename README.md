[![MELPA](http://melpa.org/packages/helm-shell-badge.svg)](http://melpa.org/#/helm-shell)

# helm-shell
Helm bindings for managing multi-shell shells

Create and delete multi-shell shells easily with Helm

A call to `helm-shell` will show a list of running shell sessions
by examining buffers with major mode `shell-mode`.  From there, you
should be able to create, delete or switch over to existing
shell buffers

![helm-shell](mt.gif)

# Setup
Invoke `helm-shell` and bind it to a keyboard shortcut

```
(require 'helm-shell)
(global-set-key (kbd "C-x t") 'helm-shell)
```
