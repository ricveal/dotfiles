#!/usr/bin/osascript

use framework "Foundation"
use scripting additions

set duration to "180"

-- legacy token is available at https://api.slack.com/custom-integrations/legacy-tokens
set token to do shell script "security find-generic-password -w -a ${USER} -D \"environment variable\" -s \"SLACK_TOKEN\""

set curlString to "curl 'https://slack.com/api/dnd.setSnooze?token=" & token & "&num_minutes=" & duration & "'"
do shell script curlString