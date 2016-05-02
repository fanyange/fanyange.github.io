---
title: Command Line
---
## Command History

<http://www.softpanorama.org/Scripting/Shellorama/bash_command_history_reuse.shtml>

- `!!`
- `!n`
- `!-n`
- `!gzip`
- `!?etc.gz`
 
 
- `!!:1` => `!1`
- `!!:$` => `!$`

## 批量重命名
    ls -l | gxargs -i mv {} {}.bak

## 空间占用
    du -sh *
