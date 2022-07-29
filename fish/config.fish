if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.aliases
    cat ~/todo.txt
    bind \e\e 'fish_commandline_prepend sudo'
end
