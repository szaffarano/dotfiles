
function __complete_terraform
    set -lx COMP_LINE (string join ' ' (commandline -o))
    test (commandline -ct) = ""
    and set COMP_LINE "$COMP_LINE "
    /home/sebas/.asdf/installs/terraform/1.0.2/bin/terraform
end
complete -c terraform -a "(__complete_terraform)"

