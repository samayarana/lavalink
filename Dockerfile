# Use Java 21 (Temurin) which is the current standard for Lavalink v4
FROM eclipse-temurin:21-jre

# Set the working directory inside the container
WORKDIR /app

# 1. Copy the Lavalink executable
# Ensure the file in your GitHub is named exactly 'Lavalink.jar'
COPY Lavalink.jar .

# 2. Copy your configuration file
COPY application.yml .

# 3. CRITICAL: Copy your plugins folder containing the .jar files
# This ensures the lavasrc, youtube, and lavasearch plugins are available
COPY plugins/ ./plugins/

# Render automatically assigns a port via the $PORT environment variable.
# We tell Java to use that port, or default to 80 if not found.
# We also set Xmx to 400m to stay safely under Render's 512MB RAM limit.
CMD ["sh", "-c", "java -Xmx400m -Dserver.port=${PORT:-80} -jar Lavalink.jar"]
