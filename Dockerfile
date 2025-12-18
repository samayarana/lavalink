# Use Java 17 JRE (Lightweight and perfect for Lavalink v4)
FROM eclipse-temurin:17-jre-jammy

# Set the working directory
WORKDIR /app

# Copy the jar and config file
# Ensure these filenames match your GitHub files exactly (Case-sensitive!)
COPY Lavalink.jar .
COPY application.yml .

# Render uses the PORT environment variable. 
# While EXPOSE 80 is fine, Render ignores this and uses its own routing.
EXPOSE 80

# Recommended command for memory management on Render's Free Tier
CMD ["java", "-Xmx512m", "-jar", "Lavalink.jar"]
