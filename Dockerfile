FROM adguard/adguardhome:latest

# Tạo thư mục và cấp quyền ghi cho user hạn chế
RUN mkdir -p /data && chown -R nobody:nogroup /data

# Mồi sẵn cấu hình đổi toàn bộ cổng mặc định sang cổng cao (>1024)
RUN echo "bind_host: 0.0.0.0\nbind_port: 3000\nauth_name: admin\nauth_pass: ''\ndns:\n  bind_hosts:\n    - 0.0.0.0\n  port: 5353\n  dot_port: 8530\n  doq_port: 7840" > /data/AdGuardHome.yaml

# Chuyển sang user thường để không bị Render từ chối (Operation not permitted)
USER nobody

# Chạy ứng dụng trỏ vào thư mục data
ENTRYPOINT ["/opt/adguardhome/AdGuardHome", "-w", "/data", "-c", "/data/AdGuardHome.yaml", "--no-check-update"]

# Khai báo tất cả các cổng mã hóa và quản lý với Render
EXPOSE 3000
EXPOSE 5353/udp
EXPOSE 5353/tcp
EXPOSE 8530/tcp
EXPOSE 7840/udp
