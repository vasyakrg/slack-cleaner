# slack-cleaner

## Bulk delete messages and files on Slack.

### Scopes as you need:

```bash
channels:read
channels:write
chat:write
emoji:read
files:read
files:write
links:read
links:write
```

## Configuring app

The cleaner needs you to give Slack's API permission to let it run the operations it needs. You grant these by registering it as an app in the workspace you want to use it in.

You can grant these permissions to the app by:

- going to Your Apps
- select 'Create New App', fill out an App Name (eg 'Slack Cleaner') and select the Slack workspace you want to use it in
- select 'OAuth & Permissions' in the sidebar
- scroll down to Scopes and select all scopes you need
- select 'Save changes'
- select 'Install App to Workspace'
- review the permissions and press 'Authorize'
- copy the 'OAuth Access Token' shown, and use this token as the --token argument to the script

### Token: xoxp-10862131111-XXX

## Run:

```
docker run --rm --name slack_cleaner vasyakrg/slack-cleaner -c 'slack-cleaner --token xoxp-10862131111-XXX --message --bot --channel <channel-name> --before YYYYMMDD --perform --as_user'
```

## Arguments
```
usage: slack-cleaner [-h] --token TOKEN [--log] [--quiet] [--rate RATE]
                     [--as_user] [--message | --file | --info] [--regex]
                     [--channel CHANNEL] [--direct DIRECT] [--group GROUP]
                     [--mpdirect MPDIRECT] [--user USER] [--botname BOTNAME]
                     [--bot] [--keeppinned] [--after AFTER] [--before BEFORE]
                     [--types TYPES] [--pattern PATTERN] [--perform]
```
### optional arguments:
```
  -h, --help           show this help message and exit
  --token TOKEN        Slack API token (https://api.slack.com/web) or SLACK_TOKEN env var
  --log                Create a log file in the current directory
  --quiet              Run quietly, does not log messages deleted
  --proxy              Proxy Server url:port
  --verify             Verify option for Session (http://docs.python-requests.org/en/master/user/advanced/#ssl-cert-verification)
  --rate RATE          Delay between API calls (in seconds)
  --as_user            Pass true to delete the message as the authed user. Bot
                       users in this context are considered authed users.
  --message            Delete messages
  --file               Delete files
  --info               Show information
  --regex              Interpret channel, direct, group, and mpdirect as regex
  --channel CHANNEL    Channel name's, e.g., general
  --direct DIRECT      Direct message's name, e.g., sherry
  --group GROUP        Private group's name
  --mpdirect MPDIRECT  Multiparty direct message's name, e.g.,
                       sherry,james,johndoe
  --user USER          Delete messages/files from certain user
  --botname BOTNAME    Delete messages/files from certain bots. Implies '--bot'
  --bot                Delete messages from bots
  --keeppinned         exclude pinned messages from deletion
  --after AFTER        Delete messages/files newer than this time (YYYYMMDD)
  --before BEFORE      Delete messages/files older than this time (YYYYMMDD)
  --types TYPES        Delete files of a certain type, e.g., posts,pdfs
  --pattern PATTERN    Delete messages/files with specified pattern or if one of their attachments matches (regex)
  --perform            Perform the task
```

## Usage
```
# Delete all messages from a channel
slack-cleaner --token <TOKEN> --message --channel general --user "*"

# Delete all messages from a private group aka private channel
slack-cleaner --token <TOKEN> --message --group hr --user "*"

# Delete all messages from a direct message channel
slack-cleaner --token <TOKEN> --message --direct sherry --user johndoe

# Delete all messages from a multiparty direct message channel. Note that the
# list of usernames must contains yourself
slack-cleaner --token <TOKEN> --message --mpdirect sherry,james,johndoe --user "*"

# Delete all messages from certain user
slack-cleaner --token <TOKEN> --message --channel gossip --user johndoe

# Delete all messages from bots (especially flooding CI updates)
slack-cleaner --token <TOKEN> --message --channel auto-build --bot

# Delete all messages older than 2015/09/19
slack-cleaner --token <TOKEN> --message --channel general --user "*" --before 20150919

# Delete all files
slack-cleaner --token <TOKEN> --file --user "*"

# Delete all files from certain user
slack-cleaner --token <TOKEN> --file --user johndoe

# Delete all snippets and images
slack-cleaner --token <TOKEN> --file --types snippets,images

# Show information about users, channels:
slack-cleaner --token <TOKEN> --info

# Delete matching a regexp pattern
slack-cleaner --token <TOKEN> --pattern "(bar|foo.+)"

# TODO add add keep_pinned example, add quiet

# Always have a look at help message
slack-cleaner --help
```

## Info

- Fork [from](https://github.com/sgratzl/slack-cleaner) - Tnk!
- Fix for new api-auth [from](https://github.com/ismith/slacker/commit/8ff928c59ec77b047b7270d96936e3df7e2bc4fb) - Many tnk!
