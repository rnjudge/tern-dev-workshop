Tern can inspect docker images from any public Dockerhub repository. Unless an output file is specified using the `-o fie_name` command line option, the SBoM that Tern generates will be printed to the console. 

The default report Tern produces is a human readable report. This is a high level summary designed to give the container developer a deeper understanding of what is actually installed in the container image. This allows a developer to glean layer-by-layer information about the container such as what the true base operating system is, what packages are installed and any licenses that may govern those packages, potential files that may exist in the container, etc. To get started generating a default report for a basic photon image, run:

```
$ tern report -i photon:3.0 -o photon.txt
``` 

Look at the report generated in `photon.txt`.

```
$ vi output.txt
```

Specifically, look for:
a) Information about the Base OS
b) The list of packages in the layer as well as their associated versions and licenses.
c) The summary of licenses found in the container
d) The method of retrieval for the gathered package metadata. This will tell you the package manager that Tern used to collect the package information. You can view the specific commands/scripts used for each package manager on [GitHub](https://github.com/tern-tools/tern/blob/main/tern/analyze/default/command_lib/base.yml).

The `photon:3.0` image is based on VMware's minimalist operating system specifically optimized for cloud native applications. Becuase it is designed to be small, there is only one layer in the container with a minimal package set. To get a better sense of what an SBoM looks like with a larger container, run Tern on a larger image.

```
$ tern report -i golang:latest -o golang.txt
```

Look at the report generated in `golang.txt`.

```
$ vi golang.txt
```

Specifically, look for:
a) Information about the base OS in the first layer. Did you know that the `golang` container image was based on a debian base container image?
b) `Layer created by commands` information. This tells you which line of the dockerfile that built the container generated the particular SBoM layer.
c) The complete summary of licenses found in the container. This is a unique aggregate license list from all the layers in the container. If you want to see which license came from which layer, you can search through the previous layers to find which license is associated with which package.
d) `Unrecognized Commands` information. Tern aims to be transparent in the information it provides. If it does not recognize a line in the dockerfile that built the container, it tells you in the output report so you can investigate further, if necessary.


Once you have examined `photon.txt` and `golang.txt`, run Tern again on a docker container image of your choosing (either from a public repo or an image that is pulled locally on your computer). If you have any further questions, you can open an issue or a new discussion on Tern's [GitHub](https://github.com/tern-tools/tern) page.
