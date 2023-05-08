#
# npmrc
#
# npmrc is a tool to switch between different .npmrc files with ease and grace.
# Link: https://www.npmjs.com/package/npmrc

function check-npmrc() { readlink ~/.npmrc | cut -d '/' -f 5 }

SPACESHIP_NPMRC_SHOW="${SPACESHIP_NPMRC_SHOW=$SPACESHIP_NODE_SHOW}"
SPACESHIP_NPMRC_ASYNC="${SPACESHIP_NPMRC_ASYNC=true}"
SPACESHIP_NPMRC_PREFIX="${SPACESHIP_NPMRC_PREFIX="("}"
SPACESHIP_NPMRC_SUFFIX="${SPACESHIP_NPMRC_SUFFIX=")"}"
SPACESHIP_NPMRC_SYMBOL="${SPACESHIP_NPMRC_SYMBOL=""}"
SPACESHIP_NPMRC_COLOR="${SPACESHIP_NPMRC_COLOR="$SPACESHIP_NODE_COLOR"}"

# Show npmrc status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_npmrc() {
  # If SPACESHIP_NPMRC_SHOW is false, don't show npmrc section
  [[ $SPACESHIP_NPMRC_SHOW == false ]] && return

  # Check if npmrc is a symlink
  local is_npmrc_symlink="$(readlink ~/.npmrc)"
  [[ -n "$is_npmrc_symlink" ]] || return

  # Show NODE status only for JS-specific folders
  local is_node_project="$(spaceship::upsearch package.json .nvmrc .node-version node_modules)"
  [[ -n "$is_node_project" || -n *.js(#qN^/) || -n *.ts(#qN^/) || -n *.cjs(#qN^/) || -n *.mjs(#qN^/) ]] || return

  local npmrc_version="$(check-npmrc)"


  # Display npmrc section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_NPMRC_COLOR" \
    --prefix "$SPACESHIP_NPMRC_PREFIX" \
    --suffix "$SPACESHIP_NPMRC_SUFFIX" \
    --symbol "$SPACESHIP_NPMRC_SYMBOL" \
    "$npmrc_version"
}