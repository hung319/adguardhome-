# Sử dụng ảnh Ubuntu làm base
FROM ubuntu:latest

# Cài đặt AdGuard Home
RUN apt-get update && \
    apt-get install -y curl && \
    curl -s -S -L https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.106.3/AdGuardHome_linux_amd64.tar.gz | tar xz && \
    mv AdGuardHome/ /opt/adguardhome && \
    rm -rf AdGuardHome_linux_amd64.tar.gz

# Làm cho thư mục /opt/adguardhome làm thư mục làm việc
WORKDIR /opt/adguardhome

# Sử dụng tất cả các cổng mặc định của AdGuard Home
EXPOSE 53/tcp 53/udp 67/udp 68/tcp 68/udp 80/tcp 443/tcp 853/tcp 3000/tcp

# Khởi động AdGuard Home
CMD ["./AdGuardHome", "-s", "start"]
