_update_prompt () {
	## Save $? early, we'll need it later
	local exit="$?"

	## define some colors
	local red="31";
	local green="32";
	local yellow="33";
	local blue="34";
	local purple="35";
	local cyan="36";
	local white="37";

	local pre="\[\e[";
	local suf="\]";

	local e_blue="${pre}0;${blue}m$suf";
	local e_green="${pre}0;${green}m$suf";
	local e_purple="${pre}0;${purple}m$suf";
	local e_cyan="${pre}0;${cyan}m$suf";
	local e_white="${pre}0;${white}m$suf";
	local e_bred="$pre$red;1m$suf";
	local e_byellow="$pre$yellow;1m$suf";

	local e_normal="\[\e[0;0m\]"

	## Initial prompt
	_prompt="[$e_purple\h$e_normal:$e_cyan\W$e_normal]";

	## Color based on exit code
	local bul="\342\200\242" # bullet character
	case "$exit" in
		"0" ) ex="$e_green$bul$e_normal " ;;
		* ) ex="$e_bred$bul$e_normal " ;;
	esac

	## Color current user
	local u;
	local p;
	if [ "$UID" = "0" ]; then
		u="$e_bred\u$e_normal";
		p="$e_bred#$e_normal";
	else
		u="$e_purple\u$e_normal";
		p="\$";
	fi

	## Color git status if any
	branch=`__git_ps1 "(%s)"`
	if [ -n "$branch" ] ; then
		if [ -z "$_dumb_prompt" ]; then
			## Assumes that untracked files are always listed after modified ones
			## True for all git versions I could find
			git status --porcelain | perl -ne 'exit(1) if /^ /; exit(2) if /^[?]/'
				case "$?" in
					"0" ) branch=" $e_green$branch$e_normal" ;;
					"1" ) branch=" $e_bred$branch$e_normal" ;;
					"2" ) branch=" $e_byellow$branch$e_normal" ;;
					"130" ) branch=" $e_white$branch$e_normal" ; _dumb_prompt=1 ;;
				esac
		else
			branch=" $e_white$branch$e_normal"
		fi
	fi

	# color cover stats if any
	if [ -e .last_cover_stats ]; then
		last=$(cat .last_cover_stats)
		if [ -e .current_cover_stats ]; then
			current=$(cat .current_cover_stats)
			score_is_ok=$(perl -le "print (($current >= $last) ? 1 : 0)")
		else
			score_is_ok='1'
		fi

		if [ "x$score_is_ok" == "x1" ]; then
			score="$e_green$current%$e_normal "
		else
			score="$e_red$current / $last$e_normal "
		fi
		if [ "$current" == "$last" ]; then
			score="$e_blue$current%$e_normal "
		fi
	else
		if [[ -e .current_cover_stats ]]; then
			current=$(cat .current_cover_stats)
			score="$e_white$current%$e_normal "
		else 
			score=""
		fi
	fi

	# title
	title="[\u@\h] \w"
	e_title="\033]2;$title\007"

	export PS1="$e_title$ex$_prompt$branch $score$p ";
}

dumb_prompt () {
  _dumb_prompt=1
}

smart_prompt () {
  unset _dumb_prompt
}

if [ -n "$PS1" ] ; then
  PROMPT_COMMAND='_update_prompt'
  export PROMPT_COMMAND
fi
