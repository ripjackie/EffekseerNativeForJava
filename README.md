# EffekseerNativeForJava

This is primarily a repo to allow me to build the shared library `libEffekseerNativeForJava.so` for in use with [ChloePrime/AAAParticles](https://github.com/ChloePrime/AAAParticles).

This repo used modified, updated code from:
[effekseer/EffekseerForMultiLanguages](https://github.com/effekseer/EffekseerForMultiLanguages)

Changes included in inital commit:
- Removed swig wrapper script, used built-in CMake Swig wrapper.
- Fixed include directives to point to correct Effekseer headers
- stripped Swig build to only build for java, as this is only for Minecraft builds.

## Note: For this to build correctly, you must have $JAVA_HOME exported before trying to build, else it will fail to find the JNI.
### As an example, mine is set to `/usr/lib/jvm/default` which is a symlink to `/usr/lib/jvm/java-17-openjdk`

To Build:
```
git clone https://github.com/ripjackie/EffekseerNativeForJava.git

cd EffekseerNativeForJava

git submodule update --init

cmake -B build
cmake --build build
```
`libEffekseerNativeForJava.so` Will be in `build/src/Core/libEffekseerNativeForJava.so`

To Install:
Copy `libEffekseerNativeForJava.so` to your instances minecraft folder. Eg:
`cp build/src/Core/libEffekseerNativeForJava.so $HOME/.local/share/PrismLauncher/instances/Prominince2/minecraft/`
