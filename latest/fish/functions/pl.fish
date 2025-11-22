function pl --wraps 'uvx ruff lint' --description 'alias pl=uvx ruff lint'
    uvx ruff check $argv
end
