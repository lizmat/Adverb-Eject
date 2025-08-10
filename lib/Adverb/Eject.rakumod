multi sub postcircumfix:<[ ]>(
  \SELF, Int() $pos, :$eject!
--> Nil) is export {
    SELF.splice($pos,1) if $eject;
}
multi sub postcircumfix:<[ ]>(
  \SELF, Iterable:D \pos, :$eject!
--> Nil) is export {
    if $eject {
        SELF.splice($_,1) for pos.unique.sort( -* );
    }
}

multi sub postcircumfix:<{ }>(
  \SELF, \key, :$eject!
--> Nil) is export {
    SELF.DELETE-KEY(key) if $eject;
}
multi sub postcircumfix:<{ }>(
  \SELF, Iterable:D \keys, :$eject!
--> Nil) is export {
    if $eject {
        SELF.DELETE-KEY($_) for keys;
    }
}

#- hack ------------------------------------------------------------------------
# To allow version fetching
unit module Adverb::Eject:ver<0.0.5>:auth<zef:lizmat>;

# vim: expandtab shiftwidth=4
