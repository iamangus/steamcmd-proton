# add this to entrypoint so it is more generic
RUN mkdir -p steamapps/compatdata/${APPID}
RUN cp -r compatibilitytools.d/${PROTON_VERSION}/files/share/default_pfx steamapps/compatdata/${APPID}
ENV STEAM_COMPAT_DATA_PATH=${STEAM_PATH}/steamapps/compatdata/${APPID}

