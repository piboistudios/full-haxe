package templates;

class Index {
    var name :String;
    public function new(name) {
        this.name = name;
    }
 @:template function Index();
 public function render() {

    return this.Index();
 }
}