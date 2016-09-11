# pgcli-docker

Thin wrapper around pgcli (https://github.com/dbcli/pgcli). The default entrypoint is `["pgcli"].`

### Usage

    docker run -it --rm --network container:$postgres_container_network danihodovic/pgcli -h postgres -U postgres

You can also use the zsh/bash hack below to connect to an image that is running postgres. It only works
if there is a container running named `*postgres*`.


    function pgcli-docker () {
      postgres_container_names=$(docker ps | awk '{print $NF}' | grep postgres)
      lines=$(echo $postgres_container_names | wc -l)
      if [ "$lines" -eq 0 ]; then
        echo "No container with a name containing 'postgres' running"
        exit 1
      fi
      if [ "$lines" -gt 1 ]; then
        echo "More than one postgres container running: \n$postgres_container_names"
        exit 1
      fi

      docker run -it --rm --network container:$postgres_container_names danihodovic/pgcli -h postgres -U postgres
    }
