import ArrowKit
import PathKit
import Stencil

struct StencilArrow: Arrow {
    let arrow: String
    let help: String?
    let template: String
    let metadataName: String?
    let argumentsName: String?
    let searchPaths: [String]?

    func fire(archerfile: Archerfile, arguments: [String]) throws {
        let renderable = try systemLoader.loadTemplate(name: template, environment: environment)
        print(try renderable.render(context(archerfile: archerfile, arguments: arguments)))
    }

    func context(archerfile: Archerfile, arguments: [String]) -> [String: Any] {
        var context: [String: Any]
        if let metadataName = metadataName {
            context = [
                metadataName: archerfile.metadata
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
        return Environment()
    }
}

StencilArrow.fire()
