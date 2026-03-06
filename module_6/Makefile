- run_container:
	docker run -it \
	--entrypoint=bash \
    -p 8888:8888 -p 4040:4040 \
    -v "$(CURDIR):/app" \
    -v //app/.venv \
    test:spark
