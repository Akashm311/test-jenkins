# Use the official Python base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the Python script to the container
COPY main.py .

# Run the Python script when the container starts
CMD ["python", "main.py"]
