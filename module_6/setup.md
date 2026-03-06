1. Download and Install Java 17

```
$ wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.18%2B8/OpenJDK17U-jdk_x64_windows_hotspot_17.0.18_8.zip
$unzip OpenJDK17U-jdk_x64_windows_hotspot_17.0.18_8.zip -d /c/tools/
```

2. Add Java to PATH

```
$ export JAVA_HOME="/c/tools/jdk-17.0.18+8"
$ export PATH="${JAVA_HOME}/bin:${PATH}"
```

3. Check java version

```
$ java --version
```

```
openjdk 17.0.18 2026-01-20
OpenJDK Runtime Environment Temurin-17.0.18+8 (build 17.0.18+8)
OpenJDK 64-Bit Server VM Temurin-17.0.18+8 (build 17.0.18+8, mixed mode, sharing)
```

4. Install pyspark

```
$ uv add pyspark
```

5. Run test_spark.py