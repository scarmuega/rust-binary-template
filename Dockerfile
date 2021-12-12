FROM rust:1 as builder

WORKDIR /code

COPY . .

# since its a workspace repo, we need to cd into the correct folder for our app
WORKDIR /code/mybin

RUN cargo install --path .

FROM debian:buster-slim

#RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/cargo/bin/myapp /usr/local/bin/myapp

CMD ["mybin"]