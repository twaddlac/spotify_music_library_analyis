# Spotify Music Library Analysis

Check out my blog post [here](https://medium.com/@twaddlac/751182d8c5cd)
## Motivation
This repository was focused on analyzing [Spotify's audio features](https://developer.spotify.com/documentation/web-api/reference/#object-audiofeaturesobject) to identify what makes tracks and genres happy (or valent) with the hopes of being able to predict the valence for a track. To do this I have gathered data from a [Kaggle repository](https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks) which is a complilation of Spotify library data for each track and genre in the US market.

The questions I attempted to answer are:
1. How has music happiness changed over time?
2. What factors influence happiness?
3. What is the happiest kind of music?
4. What are the happiest songs of all time?
5. Can we predict what will make a song happy?

## Data 
As mentioned, I have gathered data from a [Kaggle repository](https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks) which has the following features:

### tracks.csv
#### Primary:
- id (Id of track generated by Spotify)
#### Numerical:
- acousticness (Ranges from 0 to 1)
- danceability (Ranges from 0 to 1)
- energy (Ranges from 0 to 1)
- duration_ms (Integer typically ranging from 200k to 300k)
- instrumentalness (Ranges from 0 to 1)
- valence (Ranges from 0 to 1)
- popularity (Ranges from 0 to 100)
- tempo (Float typically ranging from 50 to 150)
- liveness (Ranges from 0 to 1)
- loudness (Float typically ranging from -60 to 0)
- speechiness (Ranges from 0 to 1)
#### Dummy:
- mode (0 = Minor, 1 = Major)
- explicit (0 = No explicit content, 1 = Explicit content)
#### Categorical:
- key (All keys on octave encoded as values ranging from 0 to 11, starting on C as 0, C# as 1 and so on…)
- timesignature (The predicted timesignature, most typically 4)
- artists (List of artists mentioned)
- artists (Ids of mentioned artists)
- release_date (Date of release mostly in yyyy-mm-dd format, however precision of date may vary)
- name (Name of the song)

### genre.csv
#### Primary:
- genres (descriptive name of genre)
#### Numerical:
- acousticness (Ranges from 0 to 1)
- danceability (Ranges from 0 to 1)
- energy (Ranges from 0 to 1)
- duration_ms (Integer typically ranging from 200k to 300k)
- instrumentalness (Ranges from 0 to 1)
- valence (Ranges from 0 to 1)
- popularity (Ranges from 0 to 100)
- tempo (Float typically ranging from 50 to 150)
- liveness (Ranges from 0 to 1)
- loudness (Float typically ranging from -60 to 0)
- speechiness (Ranges from 0 to 1)
#### Dummy:
- mode (0 = Minor, 1 = Major)

There is a `data/us_market` directory which contains both the `tracks.csv` and `genre.csv` files which are read into the Jupyter Notebook. 

Images generated in this notebook are also saved in the `data/figures` directory.

`jolji_playlist_track_features.csv` is a list of track audio features for this [happy playlist](https://open.spotify.com/playlist/7k00dawKjXgBBuq2nZyHmO).

`Music Note Clip Art 3455.jpg` is an image used to make shape a word cloud.
## Installation
I ran this in a [Docker Data Science Notebook](https://hub.docker.com/r/jupyter/datascience-notebook/) and installed the following python libraries:
- [spotipy](https://spotipy.readthedocs.io/en/2.19.0/)
  - To use this you must obtain a secret key through [Spotify's App Registration](https://developer.spotify.com/documentation/general/guides/app-settings/)
- [joypy](https://github.com/leotac/joypy)
- [wordcloud](https://amueller.github.io/word_cloud/)

Within this Docker image the following libraries were loaded:
- numpy
- ast
- pandas
- matplotlib
- sklearn
- seaborn
- collections
- PIL

To build and run the image excute:
```
git clone https://github.com/twaddlac/spotify_music_library_analysis
cd spotify_music_library_analysis
docker build -t twaddlac/spotify_track_analysis:0.1 .
docker run -e JUPYTER_ENABLE_LAB=yes -p 8888:8888 -v "$PWD:/home/jovyan" -t  twaddlac/spotify_track_analysis:0.1
```

Alternatively you may download the image from [DockerHub](https://hub.docker.com/repository/docker/twaddlac/spotify_track_analysis).


## Acknowledgements 
I would like to thank Kaggle user [Yamac Eren Ay](https://www.kaggle.com/yamaerenay) for gathering the data and [Spotify](https://www.spotify.com/us/) for their amazing annotation to their library!

I would also like to thank Giuseppe Saldi, Kapil Thandani, and the rest of the Coronaburn group for their feedback and guidance.