package nakama.types;

import cpp.ConstCharStar;
import nakama.types.NStringMap;

/**
 * Used with authenticate/link/unlink and user.
 */
@:unreflective
@:include('nakama-cpp/data/NAccountDevice.h')
@:native('::nakama::NAccountDevice')
extern class NAccountDevice {
    var id: ConstCharStar;
    var vars: NStringMap;
}