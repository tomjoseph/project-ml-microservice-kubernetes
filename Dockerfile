FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY app.py requirements.txt Makefile  /app/
COPY model_data /app/model_data

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
#RUN pip install --upgrade pip && \ 
#    pip install -r requirements.txt
RUN make install

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
# ENTRYPOINT [ "python" ]
# CMD [ "app.py" ]
CMD ["python", "app.py"]
