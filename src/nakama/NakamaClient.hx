package nakama;

@:buildXml("
    <include name='${haxelib:nakama-haxe}/Build.xml' />
    <compilerflag value='-std=c++17' />
")
@:cppFileCode('
    #include <nakama-cpp/Nakama.h>
    #include <nakama-cpp/NClientInterface.h>
    #include <memory>
    #include <unordered_map>
    
    using namespace Nakama;
    
    static std::unordered_map<int, std::shared_ptr<NClientInterface>> g_clients;
    static int g_nextId = 1;
    
    extern "C" {
        int nakama_create_client(const char* serverKey, const char* host, int port, bool ssl) {
            NClientParameters params;
            params.serverKey = serverKey;
            params.host = host;
            params.port = port;
            params.ssl = ssl;
            auto client = createDefaultClient(params);
            
            int id = g_nextId++;
            g_clients[id] = client;
            return id;
        }
        
        void nakama_client_tick(int id) {
            auto it = g_clients.find(id);
            if (it != g_clients.end() && it->second) {
                it->second->tick();
            }
        }
        
        void nakama_client_disconnect(int id) {
            auto it = g_clients.find(id);
            if (it != g_clients.end() && it->second) {
                it->second->disconnect();
            }
        }
        
        void nakama_client_destroy(int id) {
            g_clients.erase(id);
        }
    }
')
class NakamaClient {
    var id:Int;
    
    function new(id:Int) {
        this.id = id;
    }
    
    public static function create(serverKey:String, host:String, port:Int, ssl:Bool):NakamaClient {
        var clientId = 0;
        untyped __cpp__('
            clientId = nakama_create_client({0}, {1}, {2}, {3});
        ', serverKey, host, port, ssl ? 1 : 0);
        
        return new NakamaClient(clientId);
    }
    
    public function tick():Void {
        untyped __cpp__('
            nakama_client_tick({0});
        ', id);
    }
    
    public function disconnect():Void {
        untyped __cpp__('
            nakama_client_disconnect({0});
        ', id);
    }
    
    public function __delete():Void {
        untyped __cpp__('
            nakama_client_destroy({0});
        ', id);
    }
}