FROM alpine:3.18
RUN apk add --no-cache bash
WORKDIR /app
COPY print_mintpay.sh /app/print_mintpay.sh
RUN chmod +x /app/print_mintpay.sh
CMD ["/app/print_mintpay.sh"]
