# Cron Ticker

A simple project demonstrating how to use Docker to run a scheduled task (cron job) that outputs a timestamp ("tick") at regular intervals.

## Features

- Runs a cron job inside a Docker container
- Outputs a timestamp to the console or a log file
- Easy to configure and extend

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system

### Usage

1. **Clone the repository:**
    ```bash
    git clone https://github.com/tomasDelizia/docker-cron-ticker.git
    cd cron-ticker
    ```

2. **Build the Docker image:**
    ```bash
    docker build -t cron-ticker .
    ```

3. **Run the container:**
    ```bash
    docker run --rm cron-ticker
    ```

    The container will start and the cron job will output a timestamp at the configured interval.

## Configuration

- Edit the `crontab` file or the relevant script to change the schedule or the command executed.

## Example Output

```
2024-06-01 12:00:00 Tick!
2024-06-01 12:01:00 Tick!
...
```

*Created for educational purposes.*