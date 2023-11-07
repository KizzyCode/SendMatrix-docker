# kizzycode/SendMatrix

A container for the `sendmatrix-server` from [`sendmatrix`](https://github.com/KizzyCode/SendMatrix-rust).

## First setup
To initialize `matrix-commander-rs`, start the init-service using `docker compose up sendmatrix-server-init`. Then
enter the container via perform the login procedure as per `docker compose exec -it sendmatrix-server-init sh`. This
gives you a shell so that you can setup `matrix-commander-rs` as per https://github.com/8go/matrix-commander-rs#usage.

(Usually someone would use `matrix-commander-rs --login password --verify emoji`, but you should read the documentation
nonetheless)

(Note: If you mount the persistent directories accordingly, you should only need to do this once)
