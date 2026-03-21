package nakama;

import cpp.ConstCharStar;
import cpp.Callable;
import cpp.Function;

class NakamaHelper {
    /**
     * Convert a C string to Haxe String.
     */
    public static inline function cstrToString(cstr: ConstCharStar): String {
        if (cstr == null) return null;
        return String.fromCString(cstr);
    }
    
    /**
     * Convert Haxe function to C++ callable.
     * @param f The Haxe function.
     * @return Callable wrapper.
     */
    public static inline function wrapCallback<T>(f: T->Void): Callable<T->Void> {
        return Callable.fromFunction(f);
    }
    
    /**
     * Convert Haxe function with no arguments to C++ callable.
     */
    public static inline function wrapVoidCallback(f: Void->Void): Callable<Void->Void> {
        return Callable.fromFunction(f);
    }
    
    /**
     * Wrap an error callback.
     */
    public static inline function wrapErrorCallback(f: nakama.types.NErrorPtr->Void): Callable<nakama.types.NErrorPtr->Void> {
        return Callable.fromFunction(f);
    }
}