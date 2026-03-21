package nakama.types;

/**
 * The read access permissions.
 */
@:unreflective
@:include('nakama-cpp/data/NStoragePermissions.h')
@:native('::nakama::NStoragePermissionRead')
extern enum NStoragePermissionRead {
    NO_READ;
    OWNER_READ;
    PUBLIC_READ;
}

/**
 * The write access permissions.
 */
@:unreflective
@:include('nakama-cpp/data/NStoragePermissions.h')
@:native('::nakama::NStoragePermissionWrite')
extern enum NStoragePermissionWrite {
    NO_WRITE;
    OWNER_WRITE;
}