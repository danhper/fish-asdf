function __asdf_set_version -a file -a plugin -a language_version
	if not contains $language_version (command asdf list $plugin)
		echo $plugin does not have version $language_version
		return 1
	end

	if test -f $file; and grep $plugin $file > /dev/null
		sed -i -e "s/$plugin .*/$plugin $language_version/" $file
	else
		echo "$plugin $language_version" >> $file
	end
end

function __asdf_get_version -a file -a plugin
	if not test -f $file
		echo $file does not exist
		return 1
	end
	if not grep --color=never $plugin $file
		echo $plugin version is not set in $file
	end
end

function __asdf_version -a cmd
	set -l argc (count $argv)

	if test $argc -ne 2 -a $argc -ne 3
		echo usage: $cmd PLUGIN [VERSION]
		return 1
	end

	set -l plugin $argv[2]

	set -l file
	switch $cmd
		case "global"
			set file ~/.tool-versions
		case "local"
			set file .tool-versions
	end

	if not contains $plugin (command asdf plugin-list)
		echo plugin $plugin does not exist
		return 1
	end

	if test $argc -eq 2
		__asdf_get_version $file $plugin
	else
		__asdf_set_version $file $plugin $argv[3]
	end
end

function asdf
	if test (count $argv) -eq 0
		command asdf
	else
		switch $argv[1]
			case "global" "local"
				__asdf_version $argv
			case "*"
				command asdf $argv
		end
	end
end
