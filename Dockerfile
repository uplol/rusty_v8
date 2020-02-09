FROM rustembedded/cross:aarch64-linux-android AS aarch64-linux-android

ENV TZ=Etc/UTC
RUN \
	DEBIAN_FRONTEND=noninteractive \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
	&& apt-get update && apt-get -y install lsb-release sudo python git \
	&& git clone https://github.com/denoland/chromium_build /chromium_build \
	&& /chromium_build/install-build-deps-android.sh \
	&& rm -rf /chromium_build \
	&& rm -rf /var/lib/apt/lists/*

FROM rustembedded/cross:x86_64-linux-android AS x86_64-linux-android

ENV TZ=Etc/UTC
RUN \
	DEBIAN_FRONTEND=noninteractive \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
	&& apt-get update && apt-get -y install lsb-release sudo python git \
	&& git clone https://github.com/denoland/chromium_build /chromium_build \
	&& /chromium_build/install-build-deps-android.sh \
	&& rm -rf /chromium_build \
	&& rm -rf /var/lib/apt/lists/*
