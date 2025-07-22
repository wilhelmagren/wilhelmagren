if not contains "$HOME/.cargo/bin" $PATH
    # Prepend path in case a system-installed binary needs to be overridden.
    set -x PATH "$HOME/.cargo/bin" $PATH
end
