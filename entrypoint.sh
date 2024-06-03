# add this to entrypoint so it is more generic

steamcmd=${STEAM_HOME}/steamcmd/steamcmd.sh

whoami

groups

pwd

mkdir -p steamapps/compatdata/1829350
cp -r compatibilitytools.d/${PROTON_VERSION}/files/share/default_pfx steamapps/compatdata/1829350
export STEAM_COMPAT_DATA_PATH=${STEAM_PATH}/steamapps/compatdata/1829350

cd ${STEAM_HOME}

pwd

set -x
$steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir ~/vrising +login anonymous +app_update 1829350 validate +quit || die
set +x

ls ~/vrising

vrisingExe="~/vrising/VRisingServer.exe"
if [ ! -f ${vrisingExe} ];then
    echo "${vrisingExe} does not exist"
    die
fi

$PROTON run $vrisingExe