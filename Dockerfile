FROM rust:latest as builder
WORKDIR /usr/src/lure
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /usr/src/lure/target/release/lure-pago /app/
EXPOSE 8081
CMD ["./lure-pago"]
