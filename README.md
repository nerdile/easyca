# Simple Cert Authority

These scripts are intended to simplify certificate issuance in development/testing scenarios.  Please note that this project does NOT make any attempt to explain or exemplify strong security practices for production CA's.

## Quick Start: Create a CA
1. Review/customize openssl.cnf if desired
2. Run ./ca\_create.sh myrootca
3. CA data is placed into ca/myrootca

Note: In most real-world scenarios you would use at least one intermediate CA.

## Quick Start: Issue a new cert with your CA
1. Create the request - ./req\_create.sh myserver.com
2. Sign the request - ./ca\_sign.sh myrootca myserver.com
3. Generate pfx if desired - ./req\_makepfx.sh myserver.com

Note: In most real-world scenarios, the Requestor and the CA are different people/entities. They would not share secrets with one another. The CA would only receive request.pem, sign it, and send back the signed.pem.

## Contents
- *.sh - Scripts for doing stuff
- openssl.cnf - Template for new CA's and new requests
- ./ca/ - CA data
- ./ca/name/private/ - CA secrets
- ./requests/ - Request data
- ./certs/ - Public keys of all issued certificates

## Security notes
- Keep your secrets safe.  Ideally your CA secrets should be on an offline or air-gapped machine, with strong physical security, possibly using a Hardware Security Module.

