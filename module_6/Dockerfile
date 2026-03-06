# 1. Use Python as the base
FROM python:3.12-slim

# 2. Install Java (Required for Spark), wget and pip. Do some cleanup
RUN apt-get update \
    && apt-get install -y openjdk-21-jdk-headless wget \
    && pip install uv \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# 3. Add Java and Spark to PATH
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 \
    SPARK_HOME=/opt/spark

ENV PATH="${SPARK_HOME}/bin:${JAVA_HOME}/bin:${PATH}"

# 4. Download and Install Spark 4.1.1
RUN wget https://dlcdn.apache.org/spark/spark-4.1.1/spark-4.1.1-bin-hadoop3.tgz && \
    tar -xzf spark-4.1.1-bin-hadoop3.tgz && \
    mv spark-4.1.1-bin-hadoop3 ${SPARK_HOME} && \
    rm spark-4.1.1-bin-hadoop3.tgz

WORKDIR /app
COPY . /app

# 5. Install Python dependencies using uv
RUN uv sync --frozen
