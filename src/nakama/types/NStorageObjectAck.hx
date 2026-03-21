package nakama.types;

import cpp.ConstCharStar;

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

typedef NStorageObjectAcks = RawPointer<VectorNStorageObjectAck>;

@:unreflective
@:include('nakama-cpp/data/NStorageObjectAck.h')
@:native('::std::vector<::nakama::NStorageObjectAck>')
extern class VectorNStorageObjectAck {
    function size(): cpp.SizeT;
    function at(index: cpp.SizeT): RawPointer<NStorageObjectAck>;
}