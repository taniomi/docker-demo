FROM python:3.12
RUN pip install poetry
# copy all files in current dir to destination
COPY . /src
# cd to desired dir
WORKDIR /src/docker
# install dependencies
RUN poetry install
# expose port through which streamlit will run
EXPOSE 8501
# run streamlit
ENTRYPOINT ["poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]