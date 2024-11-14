function port() {
  lsof -n -i ":$@" | grep LISTEN
}

