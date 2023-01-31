#
# Current network namespace
#
# Current network namespace display the name of your current network namespace if it is different than default.
# Link: https://www.foobar.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_NETNS_SHOW="${SPACESHIP_NETNS_SHOW=true}"
SPACESHIP_NETNS_ASYNC="${SPACESHIP_NETNS_ASYNC=true}"
SPACESHIP_NETNS_PREFIX="${SPACESHIP_NETNS_PREFIX="("}"
SPACESHIP_NETNS_SUFFIX="${SPACESHIP_NETNS_SUFFIX=")"}"
SPACESHIP_NETNS_SYMBOL="${SPACESHIP_NETNS_SYMBOL="ns🛸"}"
SPACESHIP_NETNS_COLOR="${SPACESHIP_NETNS_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current network namespace name
spaceship_current-netns() {
  # If SPACESHIP_NETNS_SHOW is false, don't show foobar section
  [[ $SPACESHIP_NETNS_SHOW == false ]] && return

  # Check if ip command is available for execution
  spaceship::exists ip || return


  netns=$(ip netns id 2> /dev/null)
  if [[ ! -z "$netns" ]]; then
    # Display netns section
    spaceship::section::v4 \
      --color "$SPACESHIP_NETNS_COLOR" \
      --prefix "$SPACESHIP_NETNS_PREFIX" \
      --symbol "$SPACESHIP_NETNS_SYMBOL${netns}" \
      --suffix "$SPACESHIP_NETNS_SUFFIX"
  fi
}
