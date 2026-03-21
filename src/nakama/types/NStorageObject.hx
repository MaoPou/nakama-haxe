package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NTimestamp;

/**
 * An object within the storage engine.
 */
@:unreflective
@:include('nakama-cpp/data/NStorageObject.h')
@:native('::nakama::NStorageObject')
extern class NStorageObject {
    var collection: ConstCharStar;
    var key: ConstCharStar;
    var userId: ConstCharStar;
    var value: ConstCharStar;
    var version: ConstCharStar;
    var permissionRead: Int32;
    var permissionWrite: Int32;
    var createTime: NTimestamp;
    var updateTime: NTimestamp;
}

typedef NStorageObjectPtr = RawPointer<NStorageObject>;
typedef NStorageObjects = RawPointer<Dynamic>;

/**
 * A storage acknowledgement.
 */
@:unreflective
@:include('nakama-cpp/data/NStorageObjectAck.h')
@:native('::nakama::NStorageObjectAck')
extern class NStorageObjectAck {
    var collection: ConstCharStar;
    var key: ConstCharStar;
    var version: ConstCharStar;
    var userId: ConstCharStar;
}

typedef NStorageObjectAckPtr = RawPointer<NStorageObjectAck>;
typedef NStorageObjectAcks = RawPointer<Dynamic>;

/**
 * List of storage objects.
 */
@:unreflective
@:include('nakama-cpp/data/NStorageObjectList.h')
@:native('::nakama::NStorageObjectList')
extern class NStorageObjectList {
    var objects: RawPointer<Dynamic>;
    var cursor: ConstCharStar;
    
    function size(): cpp.SizeT;
    function get(index: cpp.SizeT): NStorageObjectPtr;
}

typedef NStorageObjectListPtr = RawPointer<NStorageObjectList>;