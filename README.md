# Overview

[Traffic Light Protocol](https://en.wikipedia.org/wiki/Traffic_Light_Protocol) is a data classification system that is meant to 
"encourage" sharing of sensitive information. The idea has intrigued me for some time: basically data is assigned a "traffic light,"
which describes who can consume & disseminate information. The basic premise is:

- TLP::RED: Named individuals, no sharing beyond those named members.
- TLP::AMBER: Named individuals, but can be shared within org on "need to know" basis.
- TLP::GREEN: Can be shared "within the commmunity," but not posted publically.
- TLP::WHITE: standard copyright, but no other restrictions.

I've been thinking about this, because having it at the _file system_ level means that you are no longer have to worry about
enforcing TLP _above that layer._ This project is meant to be a simple playground of ideas. One modification I've made to
standard TLP is that "TLP::AMBER" is basically organizational/group share; the thought here is that since users can create
groups at will, there is little need to to do named individuals limited distribution (just create another group).

# Implementation

The current implementation is Python + Bottle for a simple "get this off the ground and test." Ideally, I'd like to get this
wedged into something that we can enforce types + caveats + whatever at the type level, as that would be the nicest.

# Ideas

- Linked time stamping for files: since we have PBKDF2 for passwords, use that to sign revisions from a user.
- Crypto: cryptographically sign everything, including "caveats" to permissions.
- Crypto: sign, hash, encrypt **EVERYTHING**.
- Use Markdown for documents, and CSV for tables. Have simple viewers/editors for both.
- "TLP::COSMIC": TLP::RED + enforced crypto + access caveats (access specific location, times, &c.).
- CAS: Content addressed storage ala Venti/Vac, but user stores offsets (so server can't even know file name, desc, &c.)
