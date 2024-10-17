# Redis sentinel experiments

## Architecture

We deploy:
    - 2 separate networks
    - networks are reachable through a "gateway" instance
    - 2 x (redis + sentinel) on first one, 
    - 1 x (redis + sentinel) on second network

  ┌───────┐ ┌───────┐ ┌──────────┐ ┌──────────┐   ┌───────┐ ┌───────┐  ┌───────────┐    
  │redis-1│ │redis-2│ │sentinel-1│ │sentinel-2│   │gateway│ │redis-3│  │sentinel-3 │    
  └───────┘ └───────┘ └──────────┘ └──────────┘   └───────┘ └───────┘  └───────────┘    
     |         |           |            |           |   |       |        |              
     ------------------------------------------------   ------------------              

This way we can play with networks disappearing and see how sentinel behaves

## Build docker images

This step is needed to add iproute2 package to redis images

    make

## Start

docker-compose --env-file .env up -d

## Documentation

The sentinel section is only available in Redis Sentinel instances. It consists of the following fields:

    sentinel_masters: Number of Redis masters monitored by this Sentinel instance
    sentinel_tilt: A value of 1 means this sentinel is in TILT mode
    sentinel_tilt_since_seconds: Duration in seconds of current TILT, or -1 if not TILTed. Added in Redis 7.0.0
    sentinel_running_scripts: The number of scripts this Sentinel is currently executing
    sentinel_scripts_queue_length: The length of the queue of user scripts that are pending execution
    sentinel_simulate_failure_flags: Flags for the SENTINEL SIMULATE-FAILURE command
