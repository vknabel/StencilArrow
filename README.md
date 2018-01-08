# 🏹 Bash Arrow


Generate files out of your Archerfile (like this one).
For more information about Archery itself head to [vknabel/Archery](https://github.com/vknabel/Archery).


Render [Stencil](https://github.com/kylef/Stencil)-Templates with contents of your Archerfile.
```json
{
	"scripts": {
        "readme": {
            "arrow": "vknabel/StencilArrow",
            "template": "README.md.stencil",
            "destination": "README.md",
        	"searchPaths": ["Scripts"]
    	}
    }
}
```
This will insert your metadata into your template and write its contents to `README.md`.


## Available Options

| Name | Type | Default |
|------|------|---------|
| template | String | Required |
| destination | String? | Print to stdout |
| metadataName | String? | Globally available. Contains the Archerfile |
| argumentsName | String? | `arguments` contains all command line args |
| searchPaths | [String]? | `["."]` search on current directory |

## Contributors
* Valentin Knabel, [@vknabel](https://github.com/vknabel), dev@vknabel.com, [@vknabel](https://twitter.com/vknabel) on Twitter


## License
Archery is available under the [MIT](https://github.com/vknabel/archery/master/LICENSE) license.
