# Sử dụng base image có sẵn Java 17 LTS (Rất quan trọng cho Lavalink)
FROM eclipse-temurin

# Thiết lập thư mục làm việc bên trong container
WORKDIR /app

# Sao chép file Lavalink.jar và application.yml từ repository của bạn vào container
COPY Lavalink.jar .
COPY application.yml .

# Expose cổng mà Lavalink sẽ chạy (khớp với 8080 trong application.yml)
EXPOSE 8080

# Đặt lệnh khởi động chính thức (thay thế Docker Command trên Render)
CMD ["java", "-jar", "Lavalink.jar"]
