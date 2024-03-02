# Beowulf Cluster Using Docker

This project simplifies the setup of a Beowulf Cluster using Docker containers. Beowulf clusters are a type of high-performance computing (HPC) cluster architecture, typically used for parallel computing tasks.

## Features

- Utilizes Docker containers for easy setup and management.
- Includes two bash scripts:
  - `makeclusters.sh`: Used to create the Beowulf cluster.
  - `deleteclusters.sh`: Used to delete the Beowulf cluster.
- Persistent storage for the cluster is managed by a storage directory created on the desktop.
- Docker image utilized:  [`mpiclone`](https://hub.docker.com/r/i212498/mpiclone), available on Docker Hub.

## Note
- Make sure to replace username with your current username in the `makeclusters.sh` file.

## Usage

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/i212498/Beowulf-Cluster-Using-Docker.git
