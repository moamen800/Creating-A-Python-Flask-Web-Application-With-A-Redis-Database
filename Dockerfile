FROM python:3.7-alpine
WORKDIR /app
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Install dependencies for building packages
RUN apk add --no-cache gcc musl-dev linux-headers

# Copy and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Expose the Flask port
EXPOSE 5000

# Copy the remaining project files
COPY . .

# Command to run the Flask app
CMD ["flask", "run"]


