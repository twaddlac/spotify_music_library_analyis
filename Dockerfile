FROM jupyter/datascience-notebook:ubuntu-20.04

USER root

RUN pip install spotipy joypy wordcloud

USER ${NB_UID}


WORKDIR "${HOME}"