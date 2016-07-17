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
    
## sed
###  usage:
```bash
sed -i -n '/a/, /b/command/pattern/substitute/g'
```

### some important regexp:
`\<abc`, `abc\>`
* group in sed: `\(pattern\)`

### command:
1. N,n
3. c, i
2. p, d

### command nested
```bash
gsed '3, 6 {/This/{/fish/d}}' pets.txt
```
