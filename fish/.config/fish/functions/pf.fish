function pf --wraps 'uv run ruff format' --description 'alias pf=uv run ruff format'
    uv run ruff format $argv
end
