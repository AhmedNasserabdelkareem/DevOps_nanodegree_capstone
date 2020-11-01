FROM python:3.7.3-stretch

## Step 1:
WORKDIR /app

## Step 2:
COPY . /app
# Copy source code to working directory

## Step 3:
RUN pip install -r requirements.txt

## Step 4:
Expose 80

## Step 5:
#Run app.py at container launch
CMD ["python","app.py"]
