## Setup

Get [mkcert](https://github.com/FiloSottile/mkcert) and [nss](https://firefox-source-docs.mozilla.org/security/nss/index.html) to create a TLS certificate and load the CA root into Firefox:

```bash
brew install mkcert nss
mkcert -install
```

Generate a TLS certificate into this project's `./nginx/tls` directory and update the system hosts file:

```bash
site_hostname=experiment.local
cd ./nginx/tls
mkcert $site_hostname
echo -e '\n127.0.0.1 '$site_hostname'\n::1       '$site_hostname | sudo tee -a /etc/hosts > /dev/null
```

## Run Experiment

Execute the following:

```bash
docker compose up --build
```

Then request https://experiment.local and note that the `lucee-0x` values are shared in the session scope.
