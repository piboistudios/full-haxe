package templates;

typedef Info = {
    var seed : String;
    var results: Int;
    var page: Int;
    var version: String;
}
typedef Location = {
    var street:String;
    var city:String;
    var state:String;
    var postcode:String;
    var coordinates:{
        var latitude: String;
        var longitude: String;
    };
    var timezone:{
        var offset: String;
        var description:String;
    };
}
typedef  Credentials = {
    var uuid:String;
    var username:String;
    var password:String;
    var salt:String;
    var md5:String;
    var sha1:String;
    var sha256:String;
}
typedef Timespan = {
    var date:String;
    var age:Int;
}
typedef User = {
    var gender:String;
    var name:{
        var title:String;
        var first:String;
        var last:String;
    };
    var location:Location;
    var email:String;
    var login:Credentials;
    var dob:Timespan;
    var registered:Timespan;
    var phone:String;
    var cell:String;
    var id: {
        var name:String;
        var value: String;
    };
    var picture: {
        var large:String;
        var medium:String;
        var thumbnail:String;
    };
    var nat:String;

}
class RandomUserResult {
    public function new(data) {
        this.results = data.results;
        this.info = data.info;
    }
    public var results : Array<User>;
    public var info : Info;
    @:template public function RandomUsers();
    public function render() {
        return this.RandomUsers();
    }
}