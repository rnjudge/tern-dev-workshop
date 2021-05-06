[SPDX](https://spdx.org/) is a format developed by the Linux Foundation to provide a standard way of reporting license information. Many compliance tools are compatible with SPDX. Tern follows the [SPDX specifications](https://spdx.org/specifications). The tag-value format is more human readable but the SPDX JSON format will likely be more interoperable between other compliance tooling. Both formats contain the same infomration and both the SPDX tag-value and SPDX JSON documents that Tern creates are valid SPDX documents that can be validated using the SPDX tooling. You can read an overview of the SPDX tag-value specification [here](https://github.com/tern-tools/tern/blob/main/docs/spdx-tag-value-overview.md) and about how Tern maps its properties to the keys mandated by the spec [here](https://github.com/tern-tools/tern/blob/main/docs/spdx-tag-value-mapping.md).

### Step 1: Generate SPDX reports for the container image

To generate an SPDX tag-value report, use the `-f/--format` command line flag.

```
$ tern report -i photon:3.0 -f spdxtagvalue -o photon.spdx
$ tern report -i photon:3.0 -f spdxjson -o photonspdx.json
# NOTE: you may want to use jq to more easily visualize the JSON data:
$ cat photonspdx.json | jq > spdx.json
``` 

In the tag-value document, take a look at:
a) SPDX document information at the top of the file.
b) The `photon` and `layer.tar` package information blocks. Tern represents the container image itself, as well as its layers, as SPDX packages.
c) The `Relationship` information in the document. This is how you know which packages belong to which layer.

For the SPDX json document, notice:
a) The same information that appears in the tag-value document also exists in the JSON document, only in a slightly different format.
b) The `LicenseRef` information summarized at the end of the file. 


### Step 2: Check if your SPDX reports validate

Tern produces valid SPDX documents for Container images. In order to verify your SPDX document, use the SPDX tool:

```
$ git clone https://github.com/spdx/tools-java.git && cd tools-java
$ export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
$ mvn clean install && cd ..
$ java -jar tools-java/target/tools-java-*-jar-with-dependencies.jar Verify photon.spdx
$ java -jar tools-java/target/tools-java-*-jar-with-dependencies.jar Verify photonspdx.json
```





