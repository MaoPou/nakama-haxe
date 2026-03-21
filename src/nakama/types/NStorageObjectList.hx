package nakama.types;

import cpp.RawPointer;
import nakama.types.NStorageObject;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * List of storage objects.
 */
@:unreflective
@:include('nakama-cpp/data/NStorageObjectList.h')
@:native('::nakama::NStorageObjectList')
extern class NStorageObjectList {
    var objects: RawPointer<VectorNStorageObject>;
    var cursor: ConstCharStar;
}

typedef NStorageObjectListPtr = RawPointer<NStorageObjectList>;