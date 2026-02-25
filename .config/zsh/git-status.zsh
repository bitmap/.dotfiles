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
	local renamed_count=0
	local submodule_count=0
	local force_push_needed=0

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
				((renamed_count++))
				;;
			"? "*)
				((untracked_count++))
				;;
			"S "*)
				((submodule_count++))
				;;
		esac
	done

	# Check if force push is needed (remote is not an ancestor of HEAD)
	if [[ $upstream_exists -eq 1 ]] && [[ $ahead -gt 0 ]]; then
		if ! git merge-base --is-ancestor @{u} HEAD 2>/dev/null; then
			force_push_needed=1
		fi
	fi

	local -A symbols=(
		[stash]='≡'
		[bisect]='↔'
		[cherrypick]='⊕'
		[revert]='↶'
		[rebase]='~'
		[detached]='⚠'
		[origin]='✓'
		[local]='•'
		[diverged]='⇅'
		[behind]='↓'
		[ahead]='↑'
		[forcepush]='⇡'
		[merge]='M'
		[conflict]='!'
		[staged]='+'
		[change]='*'
		[untracked]='?'
		[renamed]='→'
		[submodule]='⊙'
	)

	local -a statusline=("")
	local branch_status=""

	if [[ -f "$git_dir/BISECT_LOG" ]]; then
		branch_status="%F{1}${symbols[bisect]}%f"
	elif [[ -f "$git_dir/CHERRY_PICK_HEAD" ]]; then
		branch_status="%F{1}${symbols[cherrypick]}%f"
	elif [[ -f "$git_dir/REVERT_HEAD" ]]; then
		branch_status="%F{1}${symbols[revert]}%f"
	elif [[ -d "$git_dir/rebase-merge" ]] || [[ -d "$git_dir/rebase-apply" ]]; then
		local rebase_progress=""
		if [[ -f "$git_dir/rebase-merge/msgnum" ]] && [[ -f "$git_dir/rebase-merge/end" ]]; then
			local current=$(cat "$git_dir/rebase-merge/msgnum")
			local total=$(cat "$git_dir/rebase-merge/end")
			rebase_progress="${current}/${total}"
		elif [[ -f "$git_dir/rebase-apply/next" ]] && [[ -f "$git_dir/rebase-apply/last" ]]; then
			local current=$(cat "$git_dir/rebase-apply/next")
			local total=$(cat "$git_dir/rebase-apply/last")
			rebase_progress="${current}/${total}"
		fi
		branch_status="%F{1}${symbols[rebase]}${rebase_progress}%f"
	elif [[ $merge_count -gt 0 ]]; then
		branch_status="%F{1}${symbols[merge]}%f"
	elif [[ $branch == "(detached)" ]]; then
		branch_status="%F{1}${symbols[detached]}%f"
	elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
		branch_status="%F{1}${symbols[diverged]}${ahead}/${behind}%f"
	elif [[ $behind -gt 0 ]]; then
		branch_status="%F{3}${symbols[behind]}${behind}%f"
	elif [[ $ahead -gt 0 ]]; then
		if [[ $force_push_needed -eq 1 ]]; then
			branch_status="%F{1}${symbols[forcepush]}${ahead}%f"
		else
			branch_status="%F{2}${symbols[ahead]}${ahead}%f"
		fi
	elif [[ $upstream_exists -eq 1 ]]; then
		branch_status="%F{2}${symbols[origin]}%f"
	else
		branch_status="%F{3}${symbols[local]}%f"
	fi

	statusline+="${branch_status} %F{5}${branch}%f"

	[[ $stash_count -gt 0 ]] && statusline+="%F{7}${symbols[stash]}${stash_count}%f"
	[[ $merge_count -gt 0 ]] && statusline+="%F{1}${symbols[conflict]}${merge_count}%f"
	[[ $staged_count -gt 0 ]] && statusline+="%F{2}${symbols[staged]}${staged_count}%f"
	[[ $renamed_count -gt 0 ]] && statusline+="%F{4}${symbols[renamed]}${renamed_count}%f"
	[[ $modified_count -gt 0 ]] && statusline+="%F{3}${symbols[change]}${modified_count}%f"
	[[ $untracked_count -gt 0 ]] && statusline+="%F{6}${symbols[untracked]}${untracked_count}%f"
	[[ $submodule_count -gt 0 ]] && statusline+="%F{7}${symbols[submodule]}${submodule_count}%f"

	GIT_STATUSLINE=${(j: :)statusline}
}
