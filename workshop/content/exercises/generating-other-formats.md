Tern can produce SBoMs in a variety of formats. These formats might be helpful if you are working with other compliance tooling that can ingest and understand this information formatting.

### Generating a YAML report

```
$ tern report -i photon:3.0 -f yaml -o photon.yaml
```

Look at the report generated in `photon.yaml`. Specifically, notice:  
 a) The license associated with each package.
 b) The `proj_url` for each package which points you to more information about the package. 

Repeat as desired for any Docker container image of your choosing.


### Generating a JSON report

```
$ tern report -i photon:3.0 -f json -o photon.json
# You may want to use the jq utility to better visualize the json file
$ cat photon.json | jq > output.json
```

Repeat as desired for any Docker container image of your choosing.
