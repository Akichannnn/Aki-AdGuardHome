FROM adguard/adguardhome:latest

# Sao chép file cấu hình chuẩn vào vị trí ứng dụng
COPY AdGuardHome.yaml /opt/adguardhome/AdGuardHome.yaml

# Ép hệ thống tạo sẵn thư mục làm việc /tmp/work
RUN mkdir -p /tmp/work

# Chuyển quyền chạy sang user thường để vượt qua lớp bảo mật Admin của Railway
USER nobody

# Thực thi ứng dụng với cấu hình và thư mục làm việc đã được chuẩn bị sẵn
ENTRYPOINT ["/opt/adguardhome/AdGuardHome", "-w", "/tmp/work", "-c", "/opt/adguardhome/AdGuardHome.yaml", "--no-check-update"]

EXPOSE 3000
