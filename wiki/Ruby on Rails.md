---
title: Ruby on Rails
---
## Rails Guides
[Official Site](http://guides.rubyonrails.org)

## Custom modules
`lib/*` and `require '*'`


## Config
### time zones
Use `rails -D time` to know how to get time zones strings.

`config/application.rb`:

    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
