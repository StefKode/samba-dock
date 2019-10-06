FROM debian:10-slim

ADD ./docker-entrypoint.sh /

RUN apt-get update && apt-get install -y \
  samba

RUN useradd -m -p "$6$U6o31ZU.Ye$qhNJOpmIbBLPgMuz/FDHqrxZyaKtlBHBuhMXLOPLfLbjSfTnldCh8tfC9p64JXMM83WhdeIAJXAEhgNE/ZkPP." -s /bin/bash famkoch

ADD smb.conf.part /tmp
RUN cat /tmp/smb.conf.part >> /etc/samba/smb.conf

EXPOSE 445

CMD /docker-entrypoint.sh
