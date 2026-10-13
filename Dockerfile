FROM adguard/adguardhome:latest

# Sao chép file cấu hình chuẩn vào thư mục làm việc của AdGuard Home
COPY AdGuardHome.yaml /opt/adguardhome/AdGuardHome.yaml

# Chuyển quyền chạy sang user thường để vượt qua lớp bảo mật Admin của Railway
USER nobody

# Thực thi ứng dụng và bỏ qua bước kiểm tra quyền hệ thống
ENTRYPOINT ["/opt/adguardhome/AdGuardHome", "-w", "/tmp/work", "-c", "/opt/adguardhome/AdGuardHome.yaml", "--no-check-update"]

EXPOSE 3000
