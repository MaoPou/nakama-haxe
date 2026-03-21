package nakama.types;

import cpp.ConstCharStar;

/**
 * Storage objects to get.
 */
@:unreflective
@:include('nakama-cpp/data/NStorageObjectId.h')
@:native('::nakama::NReadStorageObjectId')
extern class NReadStorageObjectId {
    var collection: ConstCharStar;
    var key: ConstCharStar;
    var userId: ConstCharStar;
}

/**
 * Storage objects to delete.
 */
@:unreflective
@:include('nakama-cpp/data/NStorageObjectId.h')
@:native('::nakama::NDeleteStorageObjectId')
extern class NDeleteStorageObjectId {
    var collection: ConstCharStar;
    var key: ConstCharStar;
    var version: ConstCharStar;
}