set -l asdf_dir ~/.asdf
if set -q ASDF_DIR
	set asdf_dir $ASDF_DIR
end

source $asdf_dir/completions/asdf.fish

# local completion
complete -f -c asdf -n '__fish_asdf_needs_command' -a local -d "Set local version for a plugin"
complete -f -c asdf -n '__fish_asdf_using_command local; and __fish_asdf_arg_number 2' -a '(asdf plugin-list)'
complete -f -c asdf -n '__fish_asdf_using_command local; and __fish_asdf_arg_number 3' -a '(asdf list (__fish_asdf_arg_at 3))'

# global completion
complete -f -c asdf -n '__fish_asdf_needs_command' -a global -d "Set global version for a plugin"
complete -f -c asdf -n '__fish_asdf_using_command global; and __fish_asdf_arg_number 2' -a '(asdf plugin-list)'
complete -f -c asdf -n '__fish_asdf_using_command global; and __fish_asdf_arg_number 3' -a '(asdf list (__fish_asdf_arg_at 3))'
