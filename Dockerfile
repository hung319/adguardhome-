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

# Sử dụng cổng 53 cho DNS và 80 cho giao diện quản trị
EXPOSE 53 80

# Khởi động AdGuard Home
CMD ["./AdGuardHome", "-s", "start"]
