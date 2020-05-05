#!/usr/bin/osascript

use framework "Foundation"
use scripting additions

set statusText to ""
set statusEmoji to ""

-- legacy token is available at https://api.slack.com/custom-integrations/legacy-tokens
set token to do shell script "security find-generic-password -w -a ${USER} -D \"environment variable\" -s \"SLACK_TOKEN\""

--
set status to "{ \"status_text\": \"" & statusText & "\", \"status_emoji\": \"" & statusEmoji & "\" }"

set curlString to "curl 'https://slack.com/api/users.profile.set?token=" & token & "&profile=" & urlEncode(status) & "'"
do shell script curlString

on urlEncode(input)
	tell current application's NSString to set rawUrl to stringWithString_(input)
	set theEncodedURL to rawUrl's stringByAddingPercentEscapesUsingEncoding:4
	return theEncodedURL as Unicode text
end urlEncode