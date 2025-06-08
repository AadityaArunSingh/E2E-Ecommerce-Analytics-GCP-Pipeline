# use a base Python image
FROM python:3.12-alpine

# set working directory
WORKDIR /app

# copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy the code into container
COPY . .

# expose port 8080 for Cloud Run
EXPOSE 8080

# Run the Flask app
CMD ["python", "main.py"]
