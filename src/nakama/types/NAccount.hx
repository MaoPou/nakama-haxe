package nakama.types;

import cpp.ConstCharStar;
import cpp.RawPointer;
import nakama.types.NUser;
import nakama.types.NAccountDevice;
import nakama.types.NTimestamp;

/**
 * A user with additional account details. Always the current user.
 */
@:unreflective
@:include('nakama-cpp/data/NAccount.h')
@:native('::nakama::NAccount')
extern class NAccount {
    var user: NUser;
    var wallet: ConstCharStar;
    var email: ConstCharStar;
    var devices: RawPointer<Dynamic>; // std::vector<NAccountDevice>
    var customId: ConstCharStar;
    var verifyTime: NTimestamp;
    var disableTime: NTimestamp;
}

typedef NAccountPtr = RawPointer<NAccount>;