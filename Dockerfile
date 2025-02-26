FROM public.ecr.aws/lambda/python:3.12

# Set working directory
WORKDIR ${LAMBDA_TASK_ROOT}

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy function code and model files
COPY rickybot_lambda_add_follows.py .
COPY vit/ ./vit/

# Set the CMD to your handler
CMD ["rickybot_lambda_add_follows.lambda_handler"]