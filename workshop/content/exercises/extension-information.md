Tern does not have its own file level license scanner. In order to fill in the gap, Tern allows you to extend container image analysis with an external file analysis CLI tool or Python3 module. In order to take advantage of the extensions, both the extention tool and Tern need to be installed. While any file scanner can be incorporated to Tern, Tern has built-in support for [Scancode](https://github.com/nexB/scancode-toolkit) and [cve-bin-tool](https://github.com/intel/cve-bin-tool).

### Scancode-toolkit

[scancode-toolkit](https://github.com/nexB/scancode-toolkit) is a license analysis tool that "detects licenses, copyrights, package manifests and direct dependencies and more both in source code and binary files". Note that Scancode currently works on Python 3.5 and 3.6 but not 3.7 onwards. 

If you are running Scancode for the first time, depending on the size of the container image, it takes anywhere between 10 minutes to a few hours to run due to the number of files needed to be analyzed. Once completed, subsequent runs will be much faster as the data will be cached for future use. Since the first run of scancode can be so variable in time to complete, take a look at an already generated scancode SBoM, `sbom-with-scancode.txt`. In particular, note:

1) The names of the files 
2)
3)


### cve-bin-tool

[cve-bin-tool](https://github.com/intel/cve-bin-tool) is a command line tool which "scans for a number of common, vulnerable components (openssl, libpng, libxml2, expat and a few others) to let you know if your system includes common libraries with known vulnerabilities". Vulnerability scanning tools can also be extended to work on containers using Tern, although support for certain metadata pertaining to CVEs may not be available yet. As a result, you will not see any of the results in the generated reports but can get the direct output of cve-bin-tool printed to the console. Future iterations of Tern will include cve-bin-tool information in the reports.
