function rl --wraps 'cargo clippy' --description 'alias rl=cargo clippy'
    cargo clippy $argv
end
