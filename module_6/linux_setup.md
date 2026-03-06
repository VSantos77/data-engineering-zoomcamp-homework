0. Built docker image using Dockerfile. Image runs python 3.12. Installs Java and Spark and then syncs the venv

```
docker build . -t test:spark
```

1. Start the container. We need to map the container port to a port in the host machine to be able to access Jupyter. We also need to map the Spark Master UI port.


```
docker run -it \                    # Run in interactive mode
	--entrypoint=bash \             # Use bash as entrypoint
    -p 8888:8888 -p 4040:4040 \     # Map ports for Jupyter and Spark UI
    -v "$(CURDIR):/app" \           # Mount project volume to app
    -v //app/.venv \                # Create an anonmyous volume for .venv folder.
                                    # This prevents the .venv to be replaced by the host machine's .venv
                                    # Notice the double slash. This prevents issues when converting windows 
                                    # path to linx path
    test:spark                      # Use image from dockerfile
```

Or using make:
```
make run_container
```

2. Start Jupyter Notebooks

```
uv run jupyter notebook --ip=0.0.0.0 --no-browser --allow-root
``` 