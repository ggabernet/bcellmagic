FROM nfcore/base:1.9
LABEL authors="Gisela Gabernet, Simon Heumos, Alexander Peltzer" \
      description="Docker image containing all software requirements for the nf-core/bcellmagic pipeline"

# Install the conda environment
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
RUN ln -s /opt/conda/envs/nf-core-bcellmagic-1.3.0dev/bin/vsearch /opt/conda/envs/nf-core-bcellmagic-1.3.0dev/bin/usearch

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-bcellmagic-1.3.0dev/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-bcellmagic-1.3.0dev > nf-core-bcellmagic-1.3.0dev.yml
