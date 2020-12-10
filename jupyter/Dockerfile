FROM hiroara/myenv:plain

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh --progress=bar:force:noscroll && \
    bash /tmp/miniconda.sh -b -p $HOME/miniconda && \
    rm /tmp/miniconda.sh

ENV PATH $PATH:/root/miniconda/bin

RUN conda install -c conda-forge -y jupyterlab && \
    conda clean --all

EXPOSE 8888

RUN conda install -y \
      matplotlib \
      numpy \
      pandas \
      tqdm \
      && \
    conda install -c conda-forge -y --repodata-fn=repodata.json \
      nodejs \
      && \
    conda install -c conda-forge -y \
      ipywidgets \
      && \
    conda clean --all -y

RUN jupyter labextension install -y @jupyter-widgets/jupyterlab-manager

CMD ["jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0"]
