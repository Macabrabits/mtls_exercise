openssl genrsa -out myserver.key 2048
openssl req -new -x509 -key myserver.key -out myserver.crt -config myserver.cnf




#generate CA
openssl genrsa -aes256 -out ca-key.pem 4096
openssl req -new -x509 -sha256 -days 365 -key ca-key.pem -out ca.crt

#Generate Certificate from CA certificate 
openssl genrsa -out cert-key.pem 4096
openssl req -new -sha256 -subj "/CN=*.bakery.127.0.0.1.nip.io" -key cert-key.pem -out cert.csr
openssl x509 -req -sha256 -days 365 -in cert.csr -CA ca.crt -CAkey ca-key.pem -out cert.crt -extfile extfile.cnf -CAcreateserial