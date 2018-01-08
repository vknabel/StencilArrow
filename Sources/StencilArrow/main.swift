import ArrowKit
import PathKit
import Stencil

struct StencilArrow: Arrow {
    let arrow: String
    let help: String?
    let template: String
    let destination: String?
    let metadataName: String?
    let argumentsName: String?
    let searchPaths: [String]?

    func fire(archerfile: Archerfile, arguments: [String]) throws {
        let renderable = try environment.loadTemplate(name: template)
        let result = try renderable.render(context(archerfile: archerfile, arguments: arguments))
        if let destination = destination {
            try Path(destination).write(result)
            print("🏹  Updated \(destination)")
        } else {
            print(result)
        }
    }

    func context(archerfile: Archerfile, arguments: [String]) -> [String: Any] {
        var context: [String: Any]
        if let metadataName = metadataName {
            context = [
                metadataName: archerfile.metadata,
            ]
        } else {
            context = archerfile.metadata
        }
        context[argumentsName ?? "arguments"] = arguments
        return context
    }

    var systemLoader: Loader {
        return FileSystemLoader(paths: searchPaths?.map(Path.init(_:)) ?? [.current])
    }

    var environment: Environment {
        return Environment(loader: systemLoader)
    }
}

StencilArrow.fire()
