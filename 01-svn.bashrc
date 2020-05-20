# SVN

parse_svn_branch() {
	if [ -d .svn ]
	then
		echo \(`parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print $1}'`\|`parse_svn_rev`\)
	fi
}
parse_svn_url() {
	svn info 2>/dev/null | grep -e '^URL*' | sed -e 's#^URL: *\(.*\)#\1#g '
}
parse_svn_rev() {
	svn info 2>/dev/null | grep -e '^Revision*' | sed -e 's#^Revision: *\(.*\)#\1#g '
}
parse_svn_repository_root() {
	svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g '
}

export SVN_EDITOR=nano
