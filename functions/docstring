#!/bin/zsh -f
# Prints commented lines found directly underneath a function definition
# (inspired by Python's docstring)
# Before printing, the text is trimmed to remove leading whitespace and #,
# then \`eval\`d to allow the use of shell variables and command
# substitutions
# Params:
#   \$1 --> Name of file to parse
#   \$2 --> Regex to find docstring for.  If not provided, comments
#   printed directly under the shebang line ("module docstring") will be printed
# NOTE: Since the docstring contents are \`eval\`d, shell metacharacters
# must be escaped in order to be printed literally

local file=$1 search=${2:-#!/bin/.*}
eval "cat <<-EOF
	`awk -v f="$search" '$1 ~ f {
	        found = 1; next;
	    }
	    found == 1 {
	        if ($1 == "#")
	            print
	        else 
	            found = 0
	    }' "$file" |
	        sed 's/^[[:space:]]*# \?//'`
	EOF"

