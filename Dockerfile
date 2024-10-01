# Use the official PostgreSQL image from Docker Hub
FROM postgres:latest

# Set environment variables
ENV POSTGRES_DB=mydb
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres


# Copy the dump file into the container (if you want to restore a database)
COPY TemaccessToRemoteRp2.dump /docker-entrypoint-initdb.d/

# Copy the initialization script into the container
COPY init-db.sh /docker-entrypoint-initdb.d/

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

# Expose the PostgreSQL port
EXPOSE 5432
