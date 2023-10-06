FROM python:latest

# COPY lbg.py .
COPY . .
# COPY models.py .

RUN pip3 install -r "requirements.txt"

EXPOSE 8080

ENTRYPOINT ["python", "lbg.py"]