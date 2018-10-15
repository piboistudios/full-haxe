package routing;    
import haxe.Json;
import tink.CoreApi;
import templates.RandomUserResult;
import templates.Index;

class Root {
    public function new() {}
    @:get('/')
    @:get('/index/$name')
    public function index(name = '') {
        return new Index(name).render();
    }
    @:get('/random/$results')
    public function getRandomUser(results = '') {
        var axios = js.node.Require.require('axios');
        var response = Promise.ofJsPromise(axios.get('https://randomuser.me/api/?results=$results')).map(function(result) {
            switch(result) {
                case Success(data):
                    return new RandomUserResult(data.data).render();
                case Failure(e):
                    return 'error: $e';
            }
        });
        
        return response;
    }

    @:get('/echo')
    @:get('/echo/$msg')
    public function echo(msg = '') {
        trace(msg);
        
        return 'ECHO: $msg';
    }
}

