growi-docker-compose with GROWI Vault Example
=====================================================

This example adds the `vault-manager` container so that users can `git clone`
the wiki. Each user gets a repository that contains only the pages they are
allowed to read, as a tree of Markdown files.

GROWI Vault is read-only: `git push` is rejected, and attachments, comments,
likes and tags are not exported.

See [GROWI Docs: GROWI Vault](https://docs.growi.org/en/guide/features/vault.html)
for what the feature does, and
[GROWI Docs: Setting up GROWI Vault](https://docs.growi.org/en/admin-guide/management-cookbook/setup-vault.html)
for the administrator's guide.


Requirements
------------------

* GROWI **v8.0.0** or later
* MongoDB running as a **replica set**

The `docker-compose.yml` in this repository already satisfies both — `mongo`
runs with `--replSet rs0` and initiates a single-node replica set on first boot.
If you are upgrading an environment whose MongoDB is still standalone, convert
it first: see
[Upgrade to v8.0.x](https://docs.growi.org/en/admin-guide/upgrading/80x.html).


Install and Start
------------------

### Clone repos and copy docker-compose.override.yml

```bash
git clone https://github.com/growilabs/growi-docker-compose.git growi
cd growi
cp examples/growi-vault/docker-compose.override.yml .
```

### Set the internal secret

`VAULT_MANAGER_INTERNAL_SECRET` authenticates the GROWI app against
vault-manager. It ships as `changeme` and **must be replaced before you start
the containers**.

1. Open `docker-compose.override.yml`
2. Replace **both** occurrences of `changeme` with the same hard-to-guess value

```bash
# generates a value you can paste into both places
openssl rand -hex 32
```

Keep this value out of version control and out of your logs.

### Start

```bash
docker compose up
```

### Run the initial bootstrap

The vault starts out empty: existing pages are imported by a one-off bootstrap,
after which every page change is picked up automatically through the MongoDB
change stream.

1. Access http://localhost:3000/admin/vault
2. Run the bootstrap and wait for it to finish — the same screen shows the
   progress and the resulting repository size

To run the bootstrap automatically when the container starts instead, add
`VAULT_BOOTSTRAP_ON_START=true` to the `app` container.


Clone the wiki
------------------

Each user authenticates with their own Personal Access Token, so the clone
contains exactly the pages that user can read.

```bash
git clone http://localhost:3000/vault.git my-growi-vault
```

`git pull` afterwards brings the working copy up to date.

### Exclude personal pages

To leave `/user` pages out of the working tree:

```bash
git clone --no-checkout http://localhost:3000/vault.git my-growi-vault
cd my-growi-vault
git sparse-checkout init --cone
git sparse-checkout set '/*' '!/user'
git checkout HEAD
```

Note that sparse-checkout only controls which files are written to the working
tree — the objects are still transferred. Add `--filter=blob:none` if you also
want to limit what the server sends.


Configuration
------------------

The example sets the minimum required variables. The tuning variables for
bootstrap retries, drift detection, reconcile and gc are listed under "GROWI
Vault options" in
[GROWI Docs: Environment Variables](https://docs.growi.org/en/admin-guide/admin-cookbook/env-vars.html).

| variables | example values | description |
| --------- | -------------- | ----------- |
| `VAULT_ENABLED` | `true` | Enables the feature on the `app` container. Fixed at deploy time; it cannot be toggled from the admin UI |
| `VAULT_MANAGER_ENDPOINT` | `http://vault-manager:3001` | URL the `app` container uses to reach vault-manager |
| `VAULT_MANAGER_INTERNAL_SECRET` | *(generated)* | Shared secret between `app` and vault-manager. **Change it** |
| `VAULT_REPO_PATH` | `/data/vault-repo.git` | Path of the bare Git repository, on the volume shared with `app` |


Storage
------------------

The bare repository lives on the `growi_data` volume, alongside the data of the
`app` container. Its size grows with the number of pages and with the history
accumulated since the feature was enabled; vault-manager squashes history and
runs `git gc` periodically to keep it bounded. The admin screen at
`/admin/vault` reports the current repository size.
