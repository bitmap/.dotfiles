#!/bin/zsh

git_status() {
	export GIT_STATUSLINE=""

	local git_dir=$(git rev-parse --git-dir 2>/dev/null)

	local -a status_lines
	status_lines=("${(@f)$(git status --porcelain=v2 --branch --show-stash --untracked-files=normal 2>/dev/null)}")

	local branch=""
	local ahead=0
	local behind=0
	local upstream_exists=0
	local stash_count=0
	local merge_count=0
	local staged_count=0
	local modified_count=0
	local untracked_count=0

	for line in $status_lines; do
		case $line in
			"# branch.head "*)
				branch=${line#\# branch.head }
				;;
			"# branch.upstream "*)
				upstream_exists=1
				;;
			"# branch.ab "*)
				local ab=${line#\# branch.ab }
				ahead=${${ab%% *}#+}
				behind=${${ab##* }-}
				;;
			"# stash "*)
				stash_count=${line#\# stash }
				;;
			"u "*)
				((merge_count++))
				;;
			"1 "*)
				local xy=${line:2:2}
				[[ $xy[1] != "." ]] && ((staged_count++))
				[[ $xy[2] != "." ]] && ((modified_count++))
				;;
			"2 "*)
				local xy=${line:2:2}
				[[ $xy[1] != "." ]] && ((staged_count++))
				[[ $xy[2] != "." ]] && ((modified_count++))
				;;
			"? "*)
				((untracked_count++))
				;;
		esac
	done

	local -A symbols=(
		[stash]='≡'
		[bisect]='↔'
		[cherrypick]='◈'
		[revert]='↶'
		[rebase]='~'
		[detached]='⚠'
		[origin]='✓'
		[local]='•'
		[diverged]='≠'
		[behind]='↓'
		[ahead]='↑'
		[merge]='!'
		[staged]='+'
		[change]='*'
		[untracked]='?'
	)

	local -a statusline=("")

	if [[ -f "$git_dir/BISECT_LOG" ]]; then
		statusline+="%F{1}${symbols[bisect]}"
	elif [[ -f "$git_dir/CHERRY_PICK_HEAD" ]]; then
		statusline+="%F{1}${symbols[cherrypick]}"
	elif [[ -f "$git_dir/REVERT_HEAD" ]]; then
		statusline+="%F{1}${symbols[revert]}"
	elif [[ -d "$git_dir/rebase-merge" ]] || [[ -d "$git_dir/rebase-apply" ]]; then
		statusline+="%F{1}${symbols[rebase]}"
	elif [[ $merge_count -gt 0 ]]; then
		statusline+="%F{1}${symbols[merge]}${merge_count}"
	elif [[ $branch == "(detached)" ]]; then
		statusline+="%F{1}${symbols[detached]}"
	elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
		statusline+="%F{1}${symbols[diverged]}"
	elif [[ $behind -gt 0 ]]; then
		statusline+="%F{3}${symbols[behind]}${behind}"
	elif [[ $ahead -gt 0 ]]; then
		statusline+="%F{2}${symbols[ahead]}${ahead}"
	elif [[ $upstream_exists -eq 1 ]]; then
		statusline+="%F{2}${symbols[origin]}"
	else
		statusline+="%F{3}${symbols[local]}"
	fi

	statusline+="%F{5}${branch}%f"

	[[ $stash_count -gt 0 ]] && statusline+="${symbols[stash]}${stash_count}%f"
	[[ $staged_count -gt 0 ]] && statusline+="%F{2}${symbols[staged]}${staged_count}%f"
	[[ $modified_count -gt 0 ]] && statusline+="%F{3}${symbols[change]}${modified_count}%f"
	[[ $untracked_count -gt 0 ]] && statusline+="%F{6}${symbols[untracked]}${untracked_count}%f"

	GIT_STATUSLINE=${(j: :)statusline}
}
