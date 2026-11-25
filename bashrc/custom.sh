alias gitclean='git reset --hard HEAD && git clean -fd'

nb() {
  local branch_name="$(date +%Y-%m-%d)-$(IFS=-; echo "$*")"
  git checkout -b "$branch_name"
}

chmp() {
  git checkout main
  git pull
}

dnuke() {
  local ids="$(docker ps -q)"
  [ -n "$ids" ] && docker kill $ids
}

gpa() {
    git fetch --all --prune || return
    local current
    current=$(git branch --show-current)
    git for-each-ref --format='%(refname:short) %(upstream:short)' refs/heads |
    while read -r branch upstream; do
      [ -z "$upstream" ] && continue
      if [ "$branch" = "$current" ]; then
        git merge --ff-only "$upstream"
      else
        git fetch . "$upstream:$branch" 2>/dev/null || echo "skipped $branch (diverged)"
      fi
    done
  }

