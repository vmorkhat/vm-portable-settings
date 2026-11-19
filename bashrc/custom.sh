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
