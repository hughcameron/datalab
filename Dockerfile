
FROM daskdev/dask-notebook

ADD environment.yml /tmp/environment.yml
RUN conda env update --name base -f /tmp/environment.yml

RUN mkdir /.vscode
COPY settings.json /.vscode/settings.json
RUN chown jovyan:users -R /.vscode

RUN mkdir /home/team
WORKDIR /home/jovyan/home
CMD ["start.sh", "jupyter", "lab","--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.disable_check_xsrf=True", "--NotebookApp.token=''", "--notebook-dir=/home/team"]
