# Beowulf Cluster Using Docker

This project simplifies the setup of a Beowulf Cluster using Docker containers. Beowulf clusters are a type of high-performance computing (HPC) cluster architecture, typically used for parallel computing tasks.

## Features

- Utilizes Docker containers for easy setup and management.
- Includes two bash scripts:
  - `makecluster.sh`: Used to create the Beowulf cluster.
  - `deletecluster.sh`: Used to delete the Beowulf cluster.
- Persistent storage for the cluster is managed by a storage directory created on the desktop.
- Docker image utilized:  [`mpiclone`](https://hub.docker.com/r/i212498/mpiclone), available on Docker Hub.

## Note
- Make sure to replace username with your current username in the `makecluster.sh` file.

## Prerequisites

Before proceeding with the setup, ensure you have Docker Engine installed on your Linux-based system. If Docker Engine is not installed, follow the installation instructions provided [here](https://docs.docker.com/engine/install/ubuntu/).

## Usage
1. **Mpiclone image**
   Pull the docker image using the following command:
   ```bash
   sudo docker pull i212498/mpiclone

2. **Clone the Repository:**
   Clone this repository using the following command:
   ```bash
   git clone https://github.com/i212498/Beowulf-Cluster-Using-Docker.git

3. **makecluster.sh**
   run the makecluster.sh in this format:
   ```bash
   ./makecluster.sh no_of_nodes

4. **Path**
   When inside node1 terminal proceed to:
   ```bash
   cd /home/storage
   ```
   Where the machinefile will be located.

5. **deletecluster.sh**
   When done working with the cluster you can delete it in this format:
   ```bash
   ./deletecluster.sh no_of_nodes
