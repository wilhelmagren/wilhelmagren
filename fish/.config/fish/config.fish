function fish_greeting
end

if status is-interactive
    set -gx COLORTERM truecolor
    set -g fish_term24bit 1

    zoxide init fish | source
    starship init fish | source
end
