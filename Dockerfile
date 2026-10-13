FROM adguard/adguardhome:latest

# Tạo thư mục làm việc chuyên dụng trong phân vùng an toàn và cấp quyền sở hữu cho user nobody
RUN mkdir -p /home/adguardhome/work && chown -R nobody:nogroup /home/adguardhome

# Sao chép file cấu hình chuẩn vào thư mục an toàn vừa tạo
COPY AdGuardHome.yaml /home/adguardhome/AdGuardHome.yaml
RUN chown nobody:nogroup /home/adguardhome/AdGuardHome.yaml

# Hạ quyền chạy sang user thường để vượt qua lớp bảo mật Admin của Railway
USER nobody

# Thực thi ứng dụng trỏ toàn bộ dữ liệu ghi và đọc vào phân vùng an toàn /home
ENTRYPOINT ["/opt/adguardhome/AdGuardHome", "-w", "/home/adguardhome/work", "-c", "/home/adguardhome/AdGuardHome.yaml", "--no-check-update"]

EXPOSE 3000
