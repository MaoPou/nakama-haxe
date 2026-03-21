package nakama.types;

import cpp.RawPointer;
import nakama.types.NChannelMessage;
import cpp.SizeT;
import cpp.ConstCharStar;

/**
 * A list of channel messages, usually a result of a list operation.
 */
@:unreflective
@:include('nakama-cpp/data/NChannelMessageList.h')
@:native('::nakama::NChannelMessageList')
extern class NChannelMessageList {
    var messages: RawPointer<VectorNChannelMessage>;
    var nextCursor: ConstCharStar;
    var prevCursor: ConstCharStar;
}

@:unreflective
@:include('nakama-cpp/data/NChannelMessageList.h')
@:native('::std::vector<::nakama::NChannelMessage>')
extern class VectorNChannelMessage {
    function size(): SizeT;
    function at(index: SizeT): RawPointer<NChannelMessage>;
}

typedef NChannelMessageListPtr = RawPointer<NChannelMessageList>;