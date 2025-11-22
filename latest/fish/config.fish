function fish_greeting
end

set -x GIT_WILHELM "$HOME/git/wilhelmagren"

if status is-interactive
    set -gx COLORTERM truecolor
    set -g fish_termin24bit 1
end
