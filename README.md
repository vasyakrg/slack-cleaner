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

Token: xoxp-10862131111-XXX

Run:

```
docker run --rm --name slack_cleaner vasyakrg/slack-cleaner -c 'slack-cleaner --token xoxp-10862131111-XXX --message --bot --channel <channel-name> --before YYYYMMDD --perform --as_user'
```
