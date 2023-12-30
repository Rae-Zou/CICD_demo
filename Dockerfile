# Base Image
FROM apache/airflow:2.8.0

# adds vim to the Airflow image. 
# When adding packages via apt you should switch to the root user when running the apt commands
# but do not forget to switch back to the airflow user after installation is complete.
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         vim \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow

# Copy the requirements file
COPY requirements.txt /

# Upgrade pip
# Install apache airflow with subpackages
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /requirements.txt
