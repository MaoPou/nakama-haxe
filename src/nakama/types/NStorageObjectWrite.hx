package nakama.types;

import cpp.ConstCharStar;
import nakama.types.NStoragePermissionRead;
import nakama.types.NStoragePermissionWrite;
import cpp.RawPointer;

/**
 * The object to store.
 */
@:unreflective
@:include('nakama-cpp/data/NStorageObjectWrite.h')
@:native('::nakama::NStorageObjectWrite')
extern class NStorageObjectWrite {
    var collection: ConstCharStar;
    var key: ConstCharStar;
    var value: ConstCharStar;
    var version: ConstCharStar;
    var permissionRead: RawPointer<NStoragePermissionRead>;
    var permissionWrite: RawPointer<NStoragePermissionWrite>;
}