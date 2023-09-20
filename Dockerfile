# Stage 1: Build the React.js client
FROM node:14 as client-builder
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client ./
RUN npm run build

# Stage 2: Build the Django server with the client build output
FROM python:3.8-slim

# Set environment variables for Django
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE "server.core.settings"

# Create and set the working directory
RUN mkdir /app
WORKDIR /app

# Copy the server directory contents into the container at /app
COPY server/ /app/

# Copy the built React.js client files from the client-builder stage
COPY --from=client-builder /app/client/build /app/client/build

# Install any needed packages specified in server/requirements.txt
RUN pip install -r /app/requirements.txt

# Expose the port the app runs on (adjust as needed)
EXPOSE 8000

# Start the Django development server
CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8000"]
