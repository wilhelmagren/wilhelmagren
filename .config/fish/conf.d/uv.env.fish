if not contains "$HOME/.local/bin" $PATH
    # Prepend path in case a system-installed binary needs to be overridden.
    set -x PATH "$HOME/.local/bin" $PATH
end
