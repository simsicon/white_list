white_list
==========

A domain based white list WEB interface for [autoddvpn](http://code.google.com/p/autoddvpn/)

you can comfortably add rules by domains, rather than run nslookup yourself.

Install this app in any of your server installed ruby environment in autoddvpn routed internal network, then would work.

The authentication system is not fully developed, get used to it.

```console
bundle install
rake db:migrate
ssh_host=YOUR_SSH_HOST ssh_user=YOUR_SSH_USER ssh_password=YOUR_SSH_PASSWORD rails s
open localhost:3000
```

