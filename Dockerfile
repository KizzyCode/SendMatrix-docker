# Build the server
FROM alpine:latest AS buildenv

RUN apk add cargo clang libgcc mold openssl-dev

ENV RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=/usr/bin/mold"
RUN cargo install --git https://github.com/KizzyCode/SendMatrix-rust --bins sendmatrix-server
RUN cargo install matrix-commander


# Build the real container
FROM alpine:latest

RUN apk add libgcc

RUN adduser --system --disabled-password --shell=/bin/sh --home=/home/sendmatrix --uid=1000 sendmatrix
COPY --from=buildenv /root/.cargo/bin/sendmatrix-server /usr/bin/
COPY --from=buildenv /root/.cargo/bin/matrix-commander-rs /usr/bin/

USER sendmatrix
CMD ["/usr/bin/sendmatrix-server"]
