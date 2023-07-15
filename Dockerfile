FROM golang:1-alpine AS build

WORKDIR /

COPY ./app/main.go .

RUN go build -o /main ./main.go

FROM scratch

WORKDIR /

COPY --from=build /main /main

ENTRYPOINT ["/main"]