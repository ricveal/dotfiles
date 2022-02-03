#!/usr/bin/osascript

use framework "Foundation"
use scripting additions

-- legacy token is available at https://api.slack.com/custom-integrations/legacy-tokens
set token to do shell script "security find-generic-password -w -a ${USER} -D \"environment variable\" -s \"SLACK_TOKEN\""

set curlString to "curl 'https://slack.com/api/dnd.endSnooze?token=" & token & "'"
do shell script curlString