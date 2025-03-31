FROM continuumio/miniconda3

WORKDIR /app

COPY environment.yml .

RUN conda env create -f environment.yml

SHELL ["conda", "run", "-n", "homepage", "/bin/bash", "-c"]

COPY . .

EXPOSE 5000

CMD ["conda", "run", "--no-capture-output", "-n", "homepage", "gunicorn", \
     "--bind", "0.0.0.0:5000", \
     "--workers", "3", \
     "--timeout", "60", \
     "--access-logfile", "-", \
     "--error-logfile", "-", \
     "app:app"]