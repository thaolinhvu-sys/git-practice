FROM python:3.9-slim

WORKDIR /app

# Install git + basic dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy everything into container
COPY . .

# Make entrypoint executable
RUN chmod +x .github/scripts/entrypoint.sh

# Run entrypoint when container starts
ENTRYPOINT ["bash", ".github/scripts/entrypoint.sh"]