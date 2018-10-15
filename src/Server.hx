// package;
import tink.http.containers.*;
import tink.http.Response;
import routing.Root;
import tink.web.routing.*;

class Server {
    static function main() {
        var container = new NodeContainer(8080);
        var router = new Router<Root>(new Root());
        container.run(function(req) {
            return router.route(Context.ofRequest(req))
                .recover(OutgoingResponse.reportError);
        });
    }
}

