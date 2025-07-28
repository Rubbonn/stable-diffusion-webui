FROM debian:latest
RUN apt-get update \
	&& apt-get install -y python3 python3-pip python3-venv wget git bc google-perftools libgl1 libglib2.0-0 \
	&& apt-get clean \
	&& mkdir -m 777 /.cache \
	&& mkdir -m 777 /.config

WORKDIR /app
COPY . /app

ENTRYPOINT ["./webui.sh", "-f", "--listen", "--enable-insecure-extension-access", "--update-check", "--update-all-extensions"]
EXPOSE 7860
VOLUME ["/app"]