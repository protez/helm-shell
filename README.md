# helm-shell
Helm bindings for managing multiple shells

Create and switch multiple shells easily with Helm

A call to `helm-shell` will show a list of running shell sessions
by examining buffers with major mode `shell-mode`.  From there, you
should be able to create or switch over to existing
shell buffers

# Setup
Invoke `helm-shell` and bind it to a keyboard shortcut

```
(require 'helm-shell)
(global-set-key (kbd "s-1") 'helm-shell)
```
