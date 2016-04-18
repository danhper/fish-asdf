function __asdf_check_args
	if test (count $argv) -lt 3
		echo "global needs a plugin and a version"
		return 1
	end
	if not contains $argv[2] (command asdf plugin-list)
		echo plugin $argv[2] does not exist
		return 1
	end
	if not contains $argv[3] (command asdf list $argv[2])
		echo $argv[2] does not have version $argv[3]
		return 1
	end
end

function __asdf_set_version -a plugin -a language_version -a file
	if test -f $file; and grep $plugin $file > /dev/null
		sed -i -e "s/$plugin .*/$plugin $language_version/" $file
	else
		echo "$plugin $language_version" >> $file
	end
end

function asdf -a cmd
	switch $cmd
		case "global"
			if __asdf_check_args $argv
				__asdf_set_version $argv[2] $argv[3] ~/.tool-versions
			end
		case "local"
			if __asdf_check_args $argv
				__asdf_set_version $argv[2] $argv[3] (pwd)/.tool-versions
			end
	case "*"
			command asdf $argv
	end
end
