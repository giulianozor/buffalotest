FROM golang:1.16-rc-alpine
ENV ADDR=0.0.0.0
ENV PORT=3000
WORKDIR /test
RUN apk add git --no-cache
COPY . .
RUN go get -u github.com/gobuffalo/buffalo/buffalo
RUN go mod download
RUN go mod tidy
RUN buffalo build
