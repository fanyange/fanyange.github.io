---
title: Netw↑ork
---

- 实体层
- 连接层
  - 数据包：head:18, data: 46-1500
  - mac地址：48 bit, 12 ox11, 6 bytes
- 网络层(host to host)
  - IP: 2^8 * 4
  - 数据包：head:20-60, data: <= 65515
  - ARP protocol
- 传输层(port to port)
  - port: 0 - 65535
    socket <- (host, port)
  - UDP
  - TCP
- 应用层
