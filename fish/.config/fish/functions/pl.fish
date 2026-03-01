function pl --wraps 'uv run ruff check' --description 'alias pl=uv run ruff check'
    uv run ruff check $argv
end
